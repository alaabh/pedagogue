import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:pedagogue/constants/firestore_constants.dart';
import 'package:pedagogue/model/conversation.dart';
import 'package:pedagogue/utils/resources/api/user_session.dart';

import '../../../../model/message_chat.dart';

class ChatProvider {
  final FirebaseFirestore firebaseFirestore;
  final FirebaseStorage firebaseStorage;

  ChatProvider(this.firebaseFirestore, this.firebaseStorage);

  Stream<QuerySnapshot> getAllConversations() {
    return firebaseFirestore
        .collection(FirestoreConstants.conversation)
        .snapshots();
  }

  Future<String> createConversation({required int userId}) async {
    CollectionReference collection = FirebaseFirestore.instance.collection(
      FirestoreConstants.conversation,
    );

    List<QueryDocumentSnapshot> documents = (await collection.get()).docs;

    String? existingConversationId;

    for (var doc in documents) {
      try {
        String users = doc.get('users');

        String userSessionId = UserSession.currentUser.id.toString();

        if (users.contains(userSessionId) &&
            users.contains(userId.toString())) {
          existingConversationId = doc.id;
          break;
        }
      } catch (e) {
        if (kDebugMode) {
          print('chat_provider.dart - Conversation invalid : $e');
        }
      }
    }

    if (existingConversationId == null) {
      DocumentReference document = await collection.add({
        'messages': [],
        'users': '${UserSession.currentUser.id}-$userId',
      });

      return document.id;
    } else {
      return existingConversationId;
    }
  }

  Stream<DocumentSnapshot> getConversationById({
    required String conversationId,
  }) {
    return firebaseFirestore
        .collection(FirestoreConstants.conversation)
        .doc(conversationId)
        .snapshots();
  }

  Future<Conversation> getConversationByIdFuture({
    required String conversationId,
  }) async {
    DocumentSnapshot snapshot = await firebaseFirestore
        .collection(FirestoreConstants.conversation)
        .doc(conversationId)
        .get();

    return Conversation.fromDocument(snapshot);
  }

  Future<void> sendMessage({
    required String conversationId,
    required String text,
    required MessageType type,
  }) async {
    CollectionReference collection = FirebaseFirestore.instance.collection(
      FirestoreConstants.conversation,
    );

    DocumentReference reference = collection.doc(conversationId);
    DocumentSnapshot snapshot = await reference.get();

    if (snapshot.exists) {
      final currentMessages = (snapshot.data() as Map?)?['messages'] ?? [];

      currentMessages.add(
        MessageChat(
          senderId: UserSession.currentUser.id!,
          text: text,
          dateTime: DateTime.now(),
          type: type,
        ).toJson(),
      );

      await reference.update({'messages': currentMessages});
    }
  }

  Stream<DocumentSnapshot> getUserStatuses() {
    return firebaseFirestore
        .collection(FirestoreConstants.users)
        .doc('statuses')
        .snapshots();
  }

  Future<void> deleteConversation({required String conversationId}) async {
    CollectionReference collection = FirebaseFirestore.instance.collection(
      FirestoreConstants.conversation,
    );

    try {
      await collection.doc(conversationId).delete();
    } catch (e) {
      if (kDebugMode) {
        print('chat_provider.dart - Error deleting conversation: $e');
      }
    }
  }
}
