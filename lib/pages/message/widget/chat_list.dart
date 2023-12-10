// import 'package:flutter/material.dart';
// import 'package:flutter/scheduler.dart';
// import 'package:intl/intl.dart';
// import 'package:trills/background.dart';
// import 'package:trills/model/message.dart';
// import 'package:trills/pages/message/message_api.dart';
// import 'package:trills/pages/message/widget/message_enum.dart';
// import 'package:trills/pages/message/widget/my_message_card.dart';
// import 'package:trills/pages/message/widget/sender_message_card.dart';

// class ChatList extends StatefulWidget {
//   final String recieverUserId;
//   final bool isGroupChat;
//   const ChatList({
//     Key? key,
//     required this.recieverUserId,
//     required this.isGroupChat,
//   }) : super(key: key);

//   @override
//   State<StatefulWidget> createState() => _ChatListState();
// }

// class _ChatListState extends State<ChatList> {
//   final ScrollController messageController = ScrollController();
//   List<Message> messages = [];
//   late List<dynamic> matches;
//   bool isLoading = false;
//   List<Message> dummyMessages = [
//     Message(
//       senderId: 'user1',
//       recieverid: 'user2',
//       text:
//           'Hi Jake, how are you? I saw on the app that we’ve crossed paths several times this week 😄',
//       type: MessageEnum.text,
//       timeSent: DateTime.now(),
//       messageId: '1',
//       isSeen: false,
//       repliedMessage: '',
//       repliedTo: '',
//       repliedMessageType: MessageEnum.text,
//     ),
//     Message(
//       senderId: 'user2',
//       recieverid: 'user1',
//       text: 'Hi! How are you?',
//       type: MessageEnum.text,
//       timeSent: DateTime.now(),
//       messageId: '2',
//       isSeen: false,
//       repliedMessage: '',
//       repliedTo: '',
//       repliedMessageType: MessageEnum.text,
//     ),
//     // Add more dummy messages as needed
//   ];
//   getChatMessages() async {
//     setState(() {
//       isLoading = false;
//     });

//     var response =
//         await MessageApi().getChatMessages('654d0d091d6f3ef72aafc684');
//     if (response.success) {
//       matches = response.data['result'];

//       // for (var document in matches) {
//       //   messages.add(Message.fromMap(document));
//       // }
//       setState(() {
//         isLoading = false;
//       });
//     } else {
//       setState(() {
//         isLoading = false;
//       });
//       // matches = [];
//       // isLoading = false;
//       // setState(() {});
//     }

//     // {result:
//     //[{_id: 654ce711f01c1427bed60058, kind: CONNECTION, status: ACCEPTED, description: Hey i want to connec with you , is_active: true, to: 654cdeb0d8afb80bc9cb6f05, from: 654ce5ac8c48695202a901ef, createdAt: 2023-11-09T14:02:56.382Z, updatedAt: 2023-11-09T16:47:06.071Z, __v: 0}, {_id: 654d3eb2be98b441fc3f08e1, kind: CONNECTION, status: PENDING, description: Hey i want to connec with you , is_active: true, from: 654cdeb0d8afb80bc9cb6f05, to: 654cdeb0d8afb80bc9cb6f05, createdAt: 2023-11-09T20:18:58.989Z, updatedAt: 2023-11-09T20:18:58.989Z, __v: 0}, {_id: 654d3ef4be98b441fc3f08e4, kind: CONNECTION, status: PENDING, description: Hey i want to connec with you , is_active: true, from: 654cdeb0d8afb80bc9cb6f05, to: 654cdeb0d8afb80bc9cb6f05, createdAt: 2023-11-09T20:20:04.799Z, updatedAt: 2023-11-09T20:20:04.799Z, __v: 0}, {_id: 654d3f1ebe98b441fc3f08e7, kind: CONNECTION, status: PENDING, description: Hey i want to connec with you , is_active: true, from: 654cdeb0d8afb80bc9cb6f05, to: 654cdeb0d8afb80bc9cb6f05,
//   }

//   @override
//   void dispose() {
//     super.dispose();
//     messageController.dispose();
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     getChatMessages();
//     super.initState();
//   }

//   void onMessageSwipe(
//     String message,
//     bool isMe,
//     MessageEnum messageEnum,
//   ) {}

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         backgroundColor: Colors.transparent,
//         body: isLoading
//             ? Center(child: CircularProgressIndicator())
//             : ListView.builder(
//                 controller: messageController,
//                 itemCount: dummyMessages.length,
//                 itemBuilder: (context, index) {
//                   final messageData = dummyMessages[index];
//                   var timeSent = DateFormat.Hm().format(messageData.timeSent);

//                   // if (!messageData.isSeen &&
//                   //     messageData.recieverid ==
//                   //         FirebaseAuth.instance.currentUser!.uid) {
//                   //   ref.read(chatControllerProvider).setChatMessageSeen(
//                   //         context,
//                   //         widget.recieverUserId,
//                   //         messageData.messageId,
//                   //       );
//                   // }
//                   if (messageData.messageId == '1')
//                   // if (messageData.senderId ==
//                   //     FirebaseAuth.instance.currentUser!.uid)
//                   {
//                     return MyMessageCard(
//                       message: messageData.text,
//                       date: timeSent,
//                       type: messageData.type,
//                       repliedText: messageData.repliedMessage,
//                       username: messageData.repliedTo,
//                       repliedMessageType: messageData.repliedMessageType,
//                       onLeftSwipe: () => onMessageSwipe(
//                         messageData.text,
//                         true,
//                         messageData.type,
//                       ),
//                       isSeen: messageData.isSeen,
//                     );
//                   }
//                   return SenderMessageCard(
//                     message: messageData.text,
//                     date: timeSent,
//                     type: messageData.type,
//                     username: messageData.repliedTo,
//                     repliedMessageType: messageData.repliedMessageType,
//                     onRightSwipe: () => onMessageSwipe(
//                       messageData.text,
//                       false,
//                       messageData.type,
//                     ),
//                     repliedText: messageData.repliedMessage,
//                   );
//                 },
//               ));

//     //  FutureBuilder<dynamic>(
//     //     future: getChatMessages(),
//     //     // stream: widget.isGroupChat
//     //     //     ? ref
//     //     //         .read(chatControllerProvider)
//     //     //         .groupChatStream(widget.recieverUserId)
//     //     //     : ref
//     //     //         .read(chatControllerProvider)
//     //     //         .chatStream(widget.recieverUserId),
//     //     builder: (context, snapshot) {
//     //       if (snapshot.connectionState == ConnectionState.waiting) {
//     //         return const Center(child: CircularProgressIndicator());
//     //       }

//     //       SchedulerBinding.instance.addPostFrameCallback((_) {
//     //         messageController
//     //             .jumpTo(messageController.position.maxScrollExtent);
//     //       });

//     //       return

//     //       ListView.builder(
//     //         controller: messageController,
//     //         itemCount: snapshot.data!.length,
//     //         itemBuilder: (context, index) {
//     //           final messageData = snapshot.data![index];
//     //           var timeSent = DateFormat.Hm().format(messageData.timeSent);

//     //           // if (!messageData.isSeen &&
//     //           //     messageData.recieverid ==
//     //           //         FirebaseAuth.instance.currentUser!.uid) {
//     //           //   ref.read(chatControllerProvider).setChatMessageSeen(
//     //           //         context,
//     //           //         widget.recieverUserId,
//     //           //         messageData.messageId,
//     //           //       );
//     //           // }
//     //           if (false)
//     //           // if (messageData.senderId ==
//     //           //     FirebaseAuth.instance.currentUser!.uid)
//     //           {
//     //             return MyMessageCard(
//     //               message: messageData.text,
//     //               date: timeSent,
//     //               type: messageData.type,
//     //               repliedText: messageData.repliedMessage,
//     //               username: messageData.repliedTo,
//     //               repliedMessageType: messageData.repliedMessageType,
//     //               onLeftSwipe: () => onMessageSwipe(
//     //                 messageData.text,
//     //                 true,
//     //                 messageData.type,
//     //               ),
//     //               isSeen: messageData.isSeen,
//     //             );
//     //           }
//     //           return SenderMessageCard(
//     //             message: messageData.text,
//     //             date: timeSent,
//     //             type: messageData.type,
//     //             username: messageData.repliedTo,
//     //             repliedMessageType: messageData.repliedMessageType,
//     //             onRightSwipe: () => onMessageSwipe(
//     //               messageData.text,
//     //               false,
//     //               messageData.type,
//     //             ),
//     //             repliedText: messageData.repliedMessage,
//     //           );
//     //         },
//     //       );
//     //     });,)
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:intl/intl.dart';
import 'package:trills/background.dart';
import 'package:trills/model/message.dart';
import 'package:trills/pages/message/message_api.dart';
import 'package:trills/pages/message/widget/message_enum.dart';
import 'package:trills/pages/message/widget/my_message_card.dart';
import 'package:trills/pages/message/widget/sender_message_card.dart';

class ChatList extends StatefulWidget {
  final String recieverUserId;
  final bool isGroupChat;
  const ChatList({
    Key? key,
    required this.recieverUserId,
    required this.isGroupChat,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  final ScrollController messageController = ScrollController();
  List<Message> messages = [];
  late List<dynamic> matches;
  bool isLoading = false;
  // List<Message> dummyMessages = [
  //   Message(
  //     senderId: 'user1',
  //     recieverid: 'user2',
  //     text:
  //         'Hi Jake, how are you? I saw on the app that we’ve crossed paths several times this week 😄',
  //     type: MessageEnum.text,
  //     timeSent: DateTime.now(),
  //     messageId: '1',
  //     isSeen: false,
  //     repliedMessage: '',
  //     repliedTo: '',
  //     repliedMessageType: MessageEnum.text,
  //   ),
  //   Message(
  //     senderId: 'user2',
  //     recieverid: 'user1',
  //     text: 'Hi! How are you?',
  //     type: MessageEnum.text,
  //     timeSent: DateTime.now(),
  //     messageId: '2',
  //     isSeen: false,
  //     repliedMessage: '',
  //     repliedTo: '',
  //     repliedMessageType: MessageEnum.text,
  //   ),
  //   // Add more dummy messages as needed
  // ];
  getChatMessages() async {
    setState(() {
      isLoading = false;
    });

    var response =
        await MessageApi().getChatMessages('654d0d091d6f3ef72aafc684');
    if (response.success) {
      matches = response.data['result'];

      for (var document in matches) {
        messages.add(Message.fromMap(document));
      }
      setState(() {
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
      // matches = [];
      // isLoading = false;
      // setState(() {});
    }

    // {result:
    //[{_id: 654ce711f01c1427bed60058, kind: CONNECTION, status: ACCEPTED, description: Hey i want to connec with you , is_active: true, to: 654cdeb0d8afb80bc9cb6f05, from: 654ce5ac8c48695202a901ef, createdAt: 2023-11-09T14:02:56.382Z, updatedAt: 2023-11-09T16:47:06.071Z, __v: 0}, {_id: 654d3eb2be98b441fc3f08e1, kind: CONNECTION, status: PENDING, description: Hey i want to connec with you , is_active: true, from: 654cdeb0d8afb80bc9cb6f05, to: 654cdeb0d8afb80bc9cb6f05, createdAt: 2023-11-09T20:18:58.989Z, updatedAt: 2023-11-09T20:18:58.989Z, __v: 0}, {_id: 654d3ef4be98b441fc3f08e4, kind: CONNECTION, status: PENDING, description: Hey i want to connec with you , is_active: true, from: 654cdeb0d8afb80bc9cb6f05, to: 654cdeb0d8afb80bc9cb6f05, createdAt: 2023-11-09T20:20:04.799Z, updatedAt: 2023-11-09T20:20:04.799Z, __v: 0}, {_id: 654d3f1ebe98b441fc3f08e7, kind: CONNECTION, status: PENDING, description: Hey i want to connec with you , is_active: true, from: 654cdeb0d8afb80bc9cb6f05, to: 654cdeb0d8afb80bc9cb6f05,
  }

  @override
  void dispose() {
    super.dispose();
    messageController.dispose();
  }

  @override
  void initState() {
    // TODO: implement initState
    getChatMessages();
    super.initState();
  }

  void onMessageSwipe(
    String message,
    bool isMe,
    MessageEnum messageEnum,
  ) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        body: isLoading
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
                controller: messageController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  final messageData = messages[index];
                  var timeSent = DateFormat.Hm().format(messageData.createdAt);

                  // if (!messageData.isSeen &&
                  //     messageData.recieverid ==
                  //         FirebaseAuth.instance.currentUser!.uid) {
                  //   ref.read(chatControllerProvider).setChatMessageSeen(
                  //         context,
                  //         widget.recieverUserId,
                  //         messageData.messageId,
                  //       );
                  // }
                  if (messageData.id == '654d13ca77e954a9a2c84524')
                  // if (messageData.senderId ==
                  //     FirebaseAuth.instance.currentUser!.uid)
                  {
                    return MyMessageCard(
                      repliedText: '',
                      type: MessageEnum.text,
                      message: messageData.messageText,
                      date: timeSent,
                      // type: messageData.,
                      //repliedText: messageData.,
                      username: messageData.chatId,
                      repliedMessageType: MessageEnum.text,
                      onLeftSwipe: () {},
                      // onLeftSwipe: () => onMessageSwipe(
                      //   messageData.messageText,
                      //   true,
                      //   messageData.,
                      // ),
                      isSeen: messageData.isActive,
                    );
                  }
                  return SenderMessageCard(
                    message: messageData.messageText,
                    date: timeSent,
                    type: MessageEnum.text,
                    username: '',
                    repliedMessageType: MessageEnum.text,
                    onRightSwipe: () {},
                    // onRightSwipe: () => onMessageSwipe(
                    //   messageData.text,
                    //   false,
                    //   messageData.type,
                    // ),
                    repliedText: '',
                  );
                },
              ));

    //  FutureBuilder<dynamic>(
    //     future: getChatMessages(),
    //     // stream: widget.isGroupChat
    //     //     ? ref
    //     //         .read(chatControllerProvider)
    //     //         .groupChatStream(widget.recieverUserId)
    //     //     : ref
    //     //         .read(chatControllerProvider)
    //     //         .chatStream(widget.recieverUserId),
    //     builder: (context, snapshot) {
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(child: CircularProgressIndicator());
    //       }

    //       SchedulerBinding.instance.addPostFrameCallback((_) {
    //         messageController
    //             .jumpTo(messageController.position.maxScrollExtent);
    //       });

    //       return

    //       ListView.builder(
    //         controller: messageController,
    //         itemCount: snapshot.data!.length,
    //         itemBuilder: (context, index) {
    //           final messageData = snapshot.data![index];
    //           var timeSent = DateFormat.Hm().format(messageData.timeSent);

    //           // if (!messageData.isSeen &&
    //           //     messageData.recieverid ==
    //           //         FirebaseAuth.instance.currentUser!.uid) {
    //           //   ref.read(chatControllerProvider).setChatMessageSeen(
    //           //         context,
    //           //         widget.recieverUserId,
    //           //         messageData.messageId,
    //           //       );
    //           // }
    //           if (false)
    //           // if (messageData.senderId ==
    //           //     FirebaseAuth.instance.currentUser!.uid)
    //           {
    //             return MyMessageCard(
    //               message: messageData.text,
    //               date: timeSent,
    //               type: messageData.type,
    //               repliedText: messageData.repliedMessage,
    //               username: messageData.repliedTo,
    //               repliedMessageType: messageData.repliedMessageType,
    //               onLeftSwipe: () => onMessageSwipe(
    //                 messageData.text,
    //                 true,
    //                 messageData.type,
    //               ),
    //               isSeen: messageData.isSeen,
    //             );
    //           }
    //           return SenderMessageCard(
    //             message: messageData.text,
    //             date: timeSent,
    //             type: messageData.type,
    //             username: messageData.repliedTo,
    //             repliedMessageType: messageData.repliedMessageType,
    //             onRightSwipe: () => onMessageSwipe(
    //               messageData.text,
    //               false,
    //               messageData.type,
    //             ),
    //             repliedText: messageData.repliedMessage,
    //           );
    //         },
    //       );
    //     });,)
  }
}
