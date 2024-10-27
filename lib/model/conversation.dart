import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:pedagogue/model/message_chat.dart';
import 'package:pedagogue/model/user.dart';
import 'package:pedagogue/utils/resources/api/user_session.dart';

class Conversation {
  String id;
  int senderId;
  int receiverId;
  List<MessageChat> messages;

  User? receiver;

  Conversation({
    required this.id,
    required this.senderId,
    required this.receiverId,
    required this.messages,
    this.receiver,
  });

  factory Conversation.fromDocument(DocumentSnapshot documentSnapshot) {
    int senderId = 0;
    int receiverId = 0;
    List<MessageChat> messages = [];

    try {
      String userIds = documentSnapshot.get('users');

      List<String> userIdsSplit = userIds.split('-');

      senderId = int.tryParse(userIdsSplit.firstOrNull ?? '') ?? 0;
      receiverId = int.tryParse(userIdsSplit.lastOrNull ?? '') ?? 0;

      if (receiverId == UserSession.currentUser.id!) {
        int aux = senderId;
        senderId = receiverId;
        receiverId = aux;
      }

      messages = (documentSnapshot.get('messages') as List)
          .map((e) => MessageChat.fromMap(e))
          .toList();
    } catch (e) {
      if (kDebugMode) print("conversation.dart - Conversation invalid : $e");
    }

    return Conversation(
      id: documentSnapshot.id,
      senderId: senderId,
      receiverId: receiverId,
      messages: messages,
    );
  }
}
