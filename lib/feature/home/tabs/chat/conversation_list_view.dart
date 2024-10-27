import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:pedagogue/controller/user_controller.dart';
import 'package:pedagogue/feature/home/tabs/chat/chat_provider.dart';
import 'package:pedagogue/feature/home/tabs/chat/user_select/user_list_view.dart';
import 'package:pedagogue/feature/home/tabs/chat/widget/conversation_widget.dart';
import 'package:pedagogue/l10n/localization.dart';
import 'package:pedagogue/model/conversation.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/shared/widget/loading_widget.dart';
import 'package:pedagogue/utils/resources/api/api_view_handler.dart';
import 'package:provider/provider.dart';

import '../../../../model/user.dart';
import '../../../../utils/resources/api/user_session.dart';
import 'chat_view.dart';

class ConversationListView extends StatefulWidget {
  const ConversationListView({super.key});

  @override
  State createState() => ConversationListViewState();
}

class ConversationListViewState extends State<ConversationListView> {
  ConversationListViewState({Key? key});

  final UserController userController = UserController();

  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseStorage firebaseStorage = FirebaseStorage.instance;

  final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  final ScrollController listScrollController = ScrollController();

  late final ChatProvider chatProvider = context.read<ChatProvider>();

  final StreamController<bool> btnClearController = StreamController<bool>();
  final TextEditingController searchBarTec = TextEditingController();

  @override
  void initState() {
    super.initState();

    userController.getAll();
  }

  @override
  void dispose() {
    super.dispose();
    btnClearController.close();
  }

  List<Conversation> _getMyConversationList(List<QueryDocumentSnapshot> docs) {
    List<Conversation> conversationList = [];

    for (var doc in docs) {
      try {
        if (doc.get('users').contains(UserSession.currentUser.id.toString())) {
          conversationList.add(Conversation.fromDocument(doc));
        }
      } catch (e) {
        if (kDebugMode) {
          print('conversation_list_view.dart - Conversation invalid : $e');
        }
      }
    }

    return conversationList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Obx(
              () => ApiViewHandler.modelListBuilder(
                context,
                apiResponse: userController.apiResponse,
                loadingWidgetBuilder: () => const SizedBox.shrink(),
                builder: (userList) => _buildNewConversationButton(userList),
              ),
            ),
            Expanded(
              child: _buildConversationList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNewConversationButton(List<User> userList) {
    return Container(
      padding: Dimensions.paddingMedium,
      width: double.maxFinite,
      child: OutlinedButton(
        onPressed: () => Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => UserListView(
              userList: userList,
              callback: (User selectedUser) {
                if (selectedUser.id != null) {
                  ApiViewHandler.futureWithAlert<Conversation>(
                    context: context,
                    future: chatProvider
                        .createConversation(userId: selectedUser.id!)
                        .then(
                      (conversationId) {
                        return chatProvider.getConversationByIdFuture(
                          conversationId: conversationId,
                        );
                      },
                    ),
                    successFunction: (conversation) {
                      conversation.receiver = userList.firstWhereOrNull(
                        (element) => element.id == conversation.receiverId,
                      );

                      if (Navigator.canPop(context)) Navigator.pop(context);
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Provider(
                            create: (_) => ChatProvider(
                              FirebaseFirestore.instance,
                              FirebaseStorage.instance,
                            ),
                            child: ChatView(
                              conversation: conversation,
                            ),
                          ),
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
        child: Text(
          intl.addNew(intl.conversation.toLowerCase()),
        ),
      ),
    );
  }

  Widget _buildConversationList() {
    return StreamBuilder(
      stream: chatProvider.getUserStatuses(),
      builder: (context, snapshot) {
        Map<String, bool> userStatusMap = {};

        try {
          final data = snapshot.data?.data() as Map<String, dynamic>?;
          if (data != null) {
            userStatusMap = data.map(
              (key, value) => MapEntry(key, value == 'online'),
            );
          }
        } catch (e) {
          if (kDebugMode) print('Error getting statuses');
        }

        return Obx(
          () => ApiViewHandler.modelListBuilder(
            context,
            apiResponse: userController.apiResponse,
            builder: (userList) => StreamBuilder<QuerySnapshot>(
              stream: chatProvider.getAllConversations(),
              builder: (
                BuildContext context,
                AsyncSnapshot<QuerySnapshot> snapshot,
              ) {
                if (snapshot.hasData && snapshot.data != null) {
                  List<Conversation> conversationList = _getMyConversationList(
                    snapshot.data!.docs,
                  );

                  if (conversationList.isNotEmpty) {
                    for (var conversation in conversationList) {
                      conversation.receiver = userList.firstWhereOrNull(
                        (element) => element.id == conversation.receiverId,
                      );

                      conversation.receiver?.isOnline =
                          userStatusMap[conversation.receiver?.id?.toString()];
                    }

                    conversationList.sort(
                      (a, b) {
                        DateTime dateA =
                            a.messages.lastOrNull?.dateTime ?? DateTime(1950);
                        DateTime dateB =
                            b.messages.lastOrNull?.dateTime ?? DateTime(1950);

                        return dateB.compareTo(dateA);
                      },
                    );

                    return ListView.builder(
                      padding: Dimensions.paddingMedium,
                      itemBuilder: (context, index) => ConversationWidget(
                        conversation: conversationList[index],
                      ),
                      itemCount: conversationList.length,
                      controller: listScrollController,
                    );
                  } else {
                    return Center(child: Text(intl.noConversations));
                  }
                } else {
                  return const LoadingWidget();
                }
              },
            ),
          ),
        );
      },
    );
  }
}
