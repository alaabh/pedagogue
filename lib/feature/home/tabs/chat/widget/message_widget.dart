import 'package:flutter/material.dart';
import 'package:pedagogue/shared/Widget/media/api_image_widget.dart';
import 'package:pedagogue/shared/style/dimensions.dart';
import 'package:pedagogue/utils/date_time_utils.dart';

import '../../../../../constants/env.dart';
import '../../../../../model/message_chat.dart';
import '../../../../../shared/style/app_color.dart';
import '../../../../../utils/resources/api/user_session.dart';

class MessageWidget extends StatelessWidget {
  final MessageChat messageChat;
  final String? profileImage;

  const MessageWidget({
    super.key,
    required this.messageChat,
    required this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    bool isMyMessage = (messageChat.senderId == UserSession.currentUser.id);

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      child: Row(
        mainAxisAlignment:
            isMyMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isMyMessage)
            ApiImageWidget(
              width: 40,
              height: 40,
              imageFilename: profileImage,
              baseUrl: imageWebUrl,
              isProfilePicture: true,
              backgroundColor: Colors.grey,
              foregroundColor: Colors.white,
            ),
          if (!isMyMessage) _buildMessage(isMyMessage),
          if (isMyMessage) _buildMessage(isMyMessage),
        ],
      ),
    );
  }

  _buildMessage(bool isMyMessage) {
    return Column(
      crossAxisAlignment:
          isMyMessage ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.largeValue,
            vertical: Dimensions.mediumValue,
          ),
          decoration: BoxDecoration(
            color: isMyMessage
                ? AppColors.primaryColor
                : AppColors.primaryDarkColor,
            // Change Colors.blue to the color you want for peer messages
            borderRadius: BorderRadius.circular(8),
          ),
          margin:
              const EdgeInsets.symmetric(horizontal: Dimensions.mediumValue),
          // Adjust margins as needed
          child: Text(
            messageChat.text,
            style: const TextStyle(color: Colors.white),
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: Dimensions.mediumValue,
          ),
          child: Text(
            DateTimeUtils.stringFromDateForConversation(messageChat.dateTime) ??
                '--:--',
            // DateFormat('dd MMM kk:mm').format(messageChat.timestamp.toDate()),
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontStyle: FontStyle.italic,
            ),
          ),
        ),
      ],
    );
  }
}
