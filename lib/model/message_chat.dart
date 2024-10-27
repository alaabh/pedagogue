import 'package:cloud_firestore/cloud_firestore.dart';

enum MessageType {
  text(0),
  image(1),
  sticker(2);

  final int value;

  const MessageType(this.value);
}

class MessageChat {
  final int senderId;
  final String text;
  final DateTime? dateTime;
  final MessageType type;

  const MessageChat({
    required this.senderId,
    required this.text,
    required this.dateTime,
    required this.type,
  });

  factory MessageChat.fromMap(Map map) {
    int senderId = (map['sender'] is String)
        ? int.tryParse(map['sender']) ?? 0
        : (map['sender'] is int)
            ? map['sender']
            : 0;

    String text = map['text'];

    Timestamp? timestamp;

    try {
      timestamp = (map['createdAt'] is Timestamp)
          ? map['createdAt']
          : (map['createdAt'] is int)
              ? Timestamp.fromMillisecondsSinceEpoch(map['createdAt'])
              : Timestamp.now();
    } catch (e) {
      try {
        timestamp = Timestamp.fromMicrosecondsSinceEpoch(map['createdAt']);
      } catch (e) {
        timestamp = null;
      }
    }

    return MessageChat(
      senderId: senderId,
      text: text,
      dateTime: timestamp?.toDate(),
      type: MessageType.text,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sender': senderId,
      'text': text,
      'createdAt': dateTime?.millisecondsSinceEpoch,
    };
  }
}
