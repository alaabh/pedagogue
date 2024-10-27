import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:pedagogue/feature/home/tabs/chat/chat_view.dart';
import 'package:pedagogue/model/conversation.dart';
import 'package:pedagogue/shared/Widget/custom_dialog.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/utils/utilities.dart';
import 'package:provider/provider.dart';

import '../../../../../constants/env.dart';
import '../../../../../l10n/localization.dart';
import '../../../../../shared/Widget/media/api_image_widget.dart';
import '../../../../../shared/style/app_color.dart';
import '../../../../../utils/date_time_utils.dart';
import '../chat_provider.dart';

class ConversationWidget extends StatelessWidget {
  final Conversation conversation;

  const ConversationWidget({
    super.key,
    required this.conversation,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onLongPress: () {
            AlertMaker.showActionAlertDialog(
              context: context,
              title: intl.deleteConfirmation,
              description: intl.areYouSureYouWantToDeleteThis(
                intl.conversation,
              ),
              alertType: AlertType.danger,
              positiveAction: () {
                ChatProvider chatProvider = ChatProvider(
                  FirebaseFirestore.instance,
                  FirebaseStorage.instance,
                );

                chatProvider.deleteConversation(
                    conversationId: conversation.id);
              },
              negativeAction: () {},
              positiveActionTitle: intl.yes,
              negativeActionTitle: intl.no,
            );
          },
          onTap: () {
            Utilities.closeKeyboard(context);

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Provider(
                  create: (_) => ChatProvider(
                    FirebaseFirestore.instance,
                    FirebaseStorage.instance,
                  ),
                  child: ChatView(conversation: conversation),
                ),
              ),
            );
          },
          child: Column(
            children: [
              Dimensions.verticalSpacingSmall,
              Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ApiImageWidget(
                        width: 60,
                        height: 60,
                        imageFilename: conversation.receiver?.image,
                        baseUrl: imageWebUrl,
                        isProfilePicture: true,
                        backgroundColor: Colors.grey,
                        foregroundColor: Colors.white,
                      ),
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: Container(
                          width: 18,
                          height: 18,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          child: Center(
                            child: Container(
                              width: 14,
                              height: 14,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    (conversation.receiver?.isOnline ?? false)
                                        ? AppColors.successColor
                                        : AppColors.warningColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Dimensions.horizontalSpacingMedium,
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            '${conversation.receiver?.fullName ?? intl.unknown}',
                            maxLines: 1,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                          child: Text(
                            conversation.messages.lastOrNull?.text ??
                                intl.noMessages,
                            maxLines: 1,
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    DateTimeUtils.stringFromDateForConversation(
                          conversation.messages.lastOrNull?.dateTime,
                        ) ??
                        '--:--',
                  ),
                  Dimensions.horizontalSpacingMedium,
                ],
              ),
              Dimensions.verticalSpacingSmall,
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
