import 'package:flutter/material.dart';
import 'package:trills/all_assets.dart';
import 'package:trills/background.dart';
import 'package:trills/model/message.dart';
import 'package:trills/pages/home/widgets/story_avatar.dart';
import 'package:trills/pages/message/message_api.dart';
import 'package:trills/pages/message/mobile_chat_screen.dart';
import 'package:trills/pages/message/widget/chat_list.dart';
import 'package:trills/pages/venue/pages/meetup_page.dart';
import 'package:trills/pages/venue/pages/select_place.dart';
import 'package:trills/routes.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});



  @override
  Widget build(BuildContext context) {
    String name = 'Name of user';
    String lastMessage = 'Last message';
    String lastTexted = 'time';
    String unRead;



    return BackgroundWidget(
        widget: Scaffold(
      backgroundColor: Colors.transparent,
      body: Padding(
        padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Messages',
              style: TextStyle(
                color: Colors.black,
                fontSize: 34,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
                // height: 0.04,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: SearchBar(
                hintText: 'Search',
                leading: Icon(Icons.search),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return ListTile(
                      // contentPadding: EdgeInsets.symmetric(vertical: 15),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => 
                                
                                ChatScreen(
                                    name: name,
                                    uid: '',
                                    isGroupChat: false,
                                    profilePic: ''))
                                    
                                    );
                      },
                      leading: CircleAvatar(
                        radius: 30,
                        child: CircleAvatar(
                          radius: 25,
                          // backgroundColor: Colors.amber,
                          child: ClipOval(
                            child: Image.asset(
                              AllAssests.sampleWomen,
                              width: 60, // Adjust the width as needed
                              height: 60, // Adjust the height as needed
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      title: Text(name),
                      subtitle: Text(lastMessage),
                      trailing: CircleAvatar(
                        radius: 11,
                        backgroundColor: Colors.orange,
                        child: Text('1'),
                      ),
                    )

                        // Container(
                        //   child: Row(
                        //     children: [
                        //       StoryWidget(name: ''),
                        //       Row(
                        //         children: [
                        //           Column(
                        //             children: [
                        //               Text(
                        //                 'Emelie',
                        //                 style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontSize: 14,
                        //                   fontFamily: 'DM Sans',
                        //                   fontWeight: FontWeight.w700,
                        //                   height: 0.11,
                        //                 ),
                        //               ),
                        //               Text(
                        //                 'Sticker 😍',
                        //                 style: TextStyle(
                        //                   color: Colors.black,
                        //                   fontSize: 14,
                        //                   fontFamily: 'DM Sans',
                        //                   fontWeight: FontWeight.w400,
                        //                   height: 0.11,
                        //                 ),
                        //               ),
                        //             ],
                        //           ),
                        //         ],
                        //       )
                        //     ],
                        //   ),
                        // )

                        ;
                  }),
            )
          ],
        ),
      ),
    ));
  }
}
