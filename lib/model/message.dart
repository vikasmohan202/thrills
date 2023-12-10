// import 'package:trills/pages/message/widget/message_enum.dart';

// class Message {
//   final String senderId;
//   final String recieverid;
//   final String text;
//   final MessageEnum type;
//   final DateTime timeSent;
//   final String messageId;
//   final bool isSeen;
//   final String repliedMessage;
//   final String repliedTo;
//   final MessageEnum repliedMessageType;

//   Message({
//     required this.senderId,
//     required this.recieverid,
//     required this.text,
//     required this.type,
//     required this.timeSent,
//     required this.messageId,
//     required this.isSeen,
//     required this.repliedMessage,
//     required this.repliedTo,
//     required this.repliedMessageType,
//   });

//   Map<String, dynamic> toMap() {
//     return {
//       'senderId': senderId,
//       'recieverid': recieverid,
//       'text': text,
//       'type': type.type,
//       'timeSent': timeSent.millisecondsSinceEpoch,
//       'messageId': messageId,
//       'isSeen': isSeen,
//       'repliedMessage': repliedMessage,
//       'repliedTo': repliedTo,
//       'repliedMessageType': repliedMessageType.type,
//     };
//   }

//   factory Message.fromMap(Map<String, dynamic> map) {
//     return Message(
//       senderId: map['senderId'] ?? '',
//       recieverid: map['recieverid'] ?? '',
//       text: map['text'] ?? '',
//       type: (map['type'] as String).toEnum(),
//       timeSent: DateTime.fromMillisecondsSinceEpoch(map['timeSent']),
//       messageId: map['messageId'] ?? '',
//       isSeen: map['isSeen'] ?? false,
//       repliedMessage: map['repliedMessage'] ?? '',
//       repliedTo: map['repliedTo'] ?? '',
//       repliedMessageType: (map['repliedMessageType'] as String).toEnum(),
//     );
//   }
// }

class Message {
  final String id;
  final String chatId;
  final String senderId;
  final String messageText;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int v;

  Message({
    required this.id,
    required this.chatId,
    required this.senderId,
    required this.messageText,
    required this.isActive,
    required this.createdAt,
    required this.updatedAt,
    required this.v,
  });

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      id: map['_id'] ?? '',
      chatId: map['chat_id'] ?? '',
      senderId: map['sender_id'] ?? '',
      messageText: map['msg'] ?? '',
      isActive: map['is_active'] ?? false,
      createdAt: DateTime.parse(map['createdAt']),
      updatedAt: DateTime.parse(map['updatedAt']),
      v: map['__v'] ?? 0,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'chat_id': chatId,
      'sender_id': senderId,
      'msg': messageText,
      'is_active': isActive,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
      '__v': v,
    };
  }
}
