import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pedagogue/feature/home/tabs/chat/widget/message_widget.dart';
import 'package:pedagogue/model/conversation.dart';
import 'package:pedagogue/shared/style/app_color.dart';
import 'package:pedagogue/utils/utilities.dart';
import 'package:provider/provider.dart';

import '../../../../constants/env.dart';
import '../../../../l10n/localization.dart';
import '../../../../model/message_chat.dart';
import '../../../../shared/Widget/media/api_image_widget.dart';
import '../../../../shared/widget/loading_widget.dart';
import 'chat_provider.dart';

class ChatView extends StatefulWidget {
  final Conversation conversation;

  const ChatView({
    super.key,
    required this.conversation,
  });

  @override
  ChatViewState createState() => ChatViewState();
}

class ChatViewState extends State<ChatView> {
  final TextEditingController textEditingController = TextEditingController();
  final ScrollController listScrollController = ScrollController();

  late final ChatProvider chatProvider = context.read<ChatProvider>();

  List<MessageChat> _getMyMessageList(DocumentSnapshot documentSnapshot) {
    try {
      return documentSnapshot
          .get('messages')
          .map<MessageChat>((e) => MessageChat.fromMap(e))
          .toList();
    } catch (e) {
      if (kDebugMode) {
        print('chat_view.dart - Message invalid : $e');
      }
    }

    return [];
  }

  void onSendMessage(String content, MessageType messageType) {
    Utilities.closeKeyboard(context);

    if (content.trim().isNotEmpty) {
      textEditingController.clear();

      chatProvider.sendMessage(
        conversationId: widget.conversation.id,
        text: content,
        type: messageType,
      );

      if (listScrollController.hasClients) {
        listScrollController.animateTo(0,
            duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
      }
    } else {
      Fluttertoast.showToast(
        msg: 'Nothing to send',
        backgroundColor: Colors.grey,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Container(
            color: AppColors.accentColor.withOpacity(0.5),
            height: 1,
          ),
        ),
        titleSpacing: 0,
        title: ListTile(
          leading: ApiImageWidget(
            width: 40,
            height: 40,
            imageFilename: widget.conversation.receiver?.image,
            baseUrl: imageWebUrl,
            isProfilePicture: true,
            backgroundColor: Colors.grey,
            foregroundColor: Colors.white,
          ),
          title: Text(
            '${widget.conversation.receiver?.fullName}',
          ),
          subtitle: Text(
            (widget.conversation.receiver?.isOnline ?? false)
                ? 'online'
                : 'offline',
            style: const TextStyle(color: Colors.grey),
          ),
        ),
      ),
      backgroundColor: AppColors.primaryBackgroundColor,
      body: Column(
        children: [
          Expanded(child: buildMessageList()),
          buildInput(),
        ],
      ),
    );
  }

  Widget buildInput() {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: const BoxDecoration(
          border: Border(top: BorderSide(color: Colors.grey, width: 0.5)),
          color: Colors.white),
      child: Row(
        children: [
          Material(
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 1),
              child: IconButton(
                icon: const Icon(Icons.attach_file),
                onPressed: () {},
                color: AppColors.primaryColor,
              ),
            ),
          ),
          Flexible(
            child: TextField(
              onSubmitted: (value) {
                onSendMessage(
                  textEditingController.text,
                  MessageType.text,
                );
              },
              style: const TextStyle(fontSize: 15),
              controller: textEditingController,
              decoration: const InputDecoration.collapsed(
                hintText: 'Type your message...',
              ),
            ),
          ),
          Material(
            color: Colors.white,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 8),
              child: IconButton(
                icon: const Icon(Icons.send),
                onPressed: () => onSendMessage(
                  textEditingController.text,
                  MessageType.text,
                ),
                color: AppColors.primaryColor,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildMessageList() {
    return StreamBuilder<DocumentSnapshot>(
      stream: chatProvider.getConversationById(
        conversationId: widget.conversation.id,
      ),
      builder: (context, snapshot) {
        if (snapshot.hasData && snapshot.data != null) {
          List<MessageChat> messageList = _getMyMessageList(
            snapshot.data!,
          ).reversed.toList();

          if (messageList.isNotEmpty) {
            return ListView.builder(
              reverse: true,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => MessageWidget(
                messageChat: messageList[index],
                profileImage: widget.conversation.receiver?.image,
              ),
              itemCount: messageList.length,
              controller: listScrollController,
            );
          } else {
            return Center(child: Text(intl.noMessageHereYet));
          }
        } else {
          return const LoadingWidget();
        }
      },
    );
  }
}
