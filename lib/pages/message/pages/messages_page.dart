import 'package:flutter/material.dart';
import 'package:trills/all_assets.dart';
import 'package:trills/background.dart';
import 'package:trills/pages/home/widgets/story_avatar.dart';

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
      body: Column(
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
          SearchBar(),
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
    ));
  }
}
