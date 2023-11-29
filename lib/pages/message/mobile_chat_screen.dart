import 'package:flutter/material.dart';
import 'package:trills/all_assets.dart';
import 'package:trills/background.dart';
import 'package:trills/pages/home/widgets/story_avatar.dart';
import 'package:trills/pages/message/widget/bottom_chat_field.dart';
import 'package:trills/pages/message/widget/chat_list.dart';

class ChatScreen extends StatefulWidget {
  final String name;
  final String uid;
  final bool isGroupChat;
  final String profilePic;
  const ChatScreen(
      {super.key,
      required this.name,
      required this.uid,
      required this.isGroupChat,
      required this.profilePic});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 248, 241, 243),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 40,
                          child: CircleAvatar(
                            radius: 35,
                            child: Image.asset(
                              AllAssests.sampleWomen,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        children: [
                          Text(
                            'Grace',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: 'DM Sans',
                              fontWeight: FontWeight.w700,
                              height: 0.06,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              CircleAvatar(
                                radius: 3,
                                backgroundColor: Colors.grey,
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'Online',
                                style: TextStyle(
                                  color: Colors.black
                                      .withOpacity(0.4000000059604645),
                                  fontSize: 12,
                                  fontFamily: 'DM Sans',
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Icon(Icons.meeting_room)
                ],
              ),
              Expanded(
                child: ChatList(
                  recieverUserId: widget.uid,
                  isGroupChat: widget.isGroupChat,
                ),
              ),
              BottomChatField(
                recieverUserId: widget.uid,
                isGroupChat: widget.isGroupChat,
              ),
            ],
          ),
        ));
  }
}
