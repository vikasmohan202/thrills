import 'package:flutter/material.dart';
import 'package:trills/all_assets.dart';
import 'package:trills/pages/home/home_api.dart';
import 'package:trills/pages/home/widgets/news_widget.dart';
import 'package:trills/pages/message/pages/messages_page.dart';
import 'package:trills/routes.dart';

import '../../../cache_magement.dart';
import '../widgets/story_avatar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  getAllPosts() async {
    var response = await HomeAPI().getAllPosts();
    print(response);
    return response['result'];

    // {result: [
    //{likes: 0,
    //_id: 654ce2cd6e4552e4b05fdfad,
    //description: This is my first post !!!,
    //type: POST,
    //photos: [],
    //videos: [],
    //is_active: true,
    //tags: [],
    //user: 654cdeb0d8afb80bc9cb6f05,
    //createdAt: 2023-11-09T13:46:53.837Z,
    //updatedAt: 2023-11-09T17:21:33.699Z, __v: 0}, {_id: 654ce2ec6e4552e4b05fdfb0, description: This is my first post , type: POST, photos: [], videos: [], is_active: true, tags: [], user: 654cdeb0d8afb80bc9cb6f05, createdAt: 2023-11-09T13:47:24.372Z, updatedAt: 2023-11-09T13:56:24.892Z, __v: 0, likes: 4}]}
  }

  void showBottomSheetAfterDelay(String Route) async {
    await Future.delayed(Duration(seconds: 3));
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
            height: MediaQuery.of(context).size.height * 0.80,
            padding: EdgeInsets.all(10.0),
            // height: 200, // Adjust the height as needed
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Let\'s Complete your Profile!! ',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Image.asset(
                  AllAssests.backgroundImage,
                  height: 200,
                  width: 200,
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, Route.toString());
                  },
                  child: Text('Complete'),
                )
              ],
            ));
      },
    );
    // await Future.delayed(Duration(seconds: 3));
    // showModalBottomSheet(
    //   context: context,
    //   builder: (BuildContext context) {
    //     return Container(
    //         height: 200, // Adjust the height as needed
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //           children: [
    //             Text('Let\'s Complete your Profile!! '),
    //             ElevatedButton(
    //               onPressed: () {
    //                 Navigator.pushReplacementNamed(context, Routes as String);
    //               },
    //               child: Text('Complete'),
    //             )
    //           ],
    //         ));
    //   },
    // );
  }

  checkCompletion() async {
    var iscompeleted = await CacheMangement().getIsCompleted();
    if (iscompeleted == false) {
      // Navigator.pushReplacementNamed(context, Routes.onboarding);
      var screenNumber = await CacheMangement().getCurrentScreen();
      switch (screenNumber) {
        case 0:
          showBottomSheetAfterDelay(Routes.profileDetailPage);
          break;
        case 1:
          showBottomSheetAfterDelay(Routes.genderPage);
          break;
        case 2:
          showBottomSheetAfterDelay(Routes.interestPage);
          break;
        default:
      }
    }
  }

  final PageController _pageController = PageController(initialPage: 0);

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    checkCompletion();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      children: [
        //Home Page
        Container(
          width: MediaQuery.sizeOf(context).width,
          height: MediaQuery.sizeOf(context).height,
          // 243,239,254
          // color:             Color.fromARGB(255, 249, 216, 248),
          padding: const EdgeInsets.only(top: 50, right: 20, left: 20),
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Color.fromARGB(255, 252, 232, 251),
                Color.fromRGBO(245, 242, 253, 1),
              ])),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'News Feed',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 28,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: 0.36,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, Routes.profilePage);
                      },
                      child: Icon(Icons.manage_accounts_outlined),
                    ),
                  ],
                ),
                SizedBox(
                  height: 120,
                  width: double.maxFinite,
                  child: Row(children: [
                    StoryWidget(
                      name: 'Your Story',
                    ),
                    Expanded(
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return StoryWidget(
                              name: 'James',
                            );
                          }),
                    )
                  ]),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.matchesPage);
                      },
                      child: Text(
                        'Make Friends',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                          elevation: 8,
                          shadowColor: Colors.purple,
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 30),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          )),
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Post'),
                      style: ElevatedButton.styleFrom(
                          elevation: 8,
                          shadowColor: Colors.purple,
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 40),
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          )),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                    future: getAllPosts(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasData) {
                        List data = snapshot.data as List;
                        return Expanded(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) {
                              return NewsWidget(
                                description: data[index]['description'],
                                likes: data[index]['likes'].toString(),
                                post_id: data[index]['_id'],
                                user_id: data[index]['user'],
                              );
                            },
                          ),
                        );
                      }
                      return Center(child: Text("No Data Found"));
                    })
              ],
            ),
          ),
        ),

        MessagesPage()
      ],
    );
  }
}
