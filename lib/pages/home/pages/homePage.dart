import 'package:flutter/material.dart';
import 'package:trills/background.dart';
import 'package:trills/pages/home/home_api.dart';
import 'package:trills/pages/home/widgets/news_widget.dart';
// Other imports...

import 'package:flutter/material.dart';
import 'package:trills/pages/home/widgets/story_avatar.dart';
import 'package:trills/routes.dart';
// Other imports...

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<Map<String, dynamic>> posts = [];
  late List<Map<String, dynamic>> story = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    fetchPosts();
  }

  void fetchPosts() async {
    setState(() {
      isLoading = true;
    });
    var response = await HomeAPI().getAllPosts();
    if (response.containsKey('result')) {
      List<Map<String, dynamic>> filteredPosts =
          List<Map<String, dynamic>>.from(response['result'])
              .where((post) => post['type'] == 'POST')
              .toList();
      List<Map<String, dynamic>> filteredStory =
          List<Map<String, dynamic>>.from(response['result'])
              .where((post) => post['type'] == 'POST')
              .toList();

      setState(() {
        posts = filteredPosts;
        story = filteredStory;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
      widget: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50, left: 16, right: 16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
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
                ],
              ),
              SizedBox(
                height: 120,
                width: double.maxFinite,
                child: Row(
                  children: [
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
                        },
                      ),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 160,
                    height: 47,
                    //width: MediaQuery.of(context).size.width * 0.5,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.matchesPage);
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 8,
                          shadowColor: Colors.purple,
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          )),
                      child: Text(
                        'Make Friends',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.12,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          height: 0.13,
                          letterSpacing: -0.41,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 160,
                    height: 47,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, Routes.addPostPage);
                      },
                      style: ElevatedButton.styleFrom(
                          elevation: 8,
                          shadowColor: Colors.purple,
                          foregroundColor: Colors.black,
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          )),
                      child: const Text(
                        'Post',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.12,
                          fontFamily: 'DM Sans',
                          fontWeight: FontWeight.w700,
                          height: 0.13,
                          letterSpacing: -0.41,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              
              posts.isEmpty
                  ? const Center(child: Text("No Data Found"))
                  : Expanded(
                          child: ListView.builder(
                            itemCount: posts.length,
                            itemBuilder: (context, index) {
                              return NewsWidget(
                                description: posts[index]['description'],
                                likes: posts[index]['likes'].toString(),
                                post_id: posts[index]['_id'],
                                user_id: posts[index]['user'],
                              );
                            },
                          ),
                        ),
            ],
          ),
        ),
      ),
    );
  }
}
