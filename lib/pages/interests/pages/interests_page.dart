import 'package:flutter/material.dart';
import 'package:trills/all_colors.dart';
import 'package:trills/background.dart';

import '../../../cache_magement.dart';
import '../../../routes.dart';
import '../../profile_detail/profile_detail_api.dart';

class InterestsPage extends StatefulWidget {
  InterestsPage({super.key});

  @override
  State<InterestsPage> createState() => _InterestsPageState();
}

class _InterestsPageState extends State<InterestsPage> {
  List<Map> data = [
    {
      'icon': Icons.camera_alt_outlined,
      'title': 'Photography',
      'selected': false,
    },
    {
      'icon': Icons.shopping_bag_outlined,
      'title': 'Shopping',
      'selected': false,
    },
    {
      'icon': Icons.mic,
      'title': 'Karaoke',
      'selected': false,
    },
    {
      'icon': Icons.attractions_sharp,
      'title': 'Yoga',
      'selected': false,
    },
    {
      'icon': Icons.cookie_outlined,
      'title': 'Cooking',
      'selected': false,
    },
    {
      'icon': Icons.sports_tennis_outlined,
      'title': 'Tennis',
      'selected': false,
    },
    {
      'icon': Icons.directions_run_rounded,
      'title': 'Run',
      'selected': false,
    },
    {
      'icon': Icons.water,
      'title': 'Swimming',
      'selected': false,
    },
    {
      'icon': Icons.color_lens_outlined,
      'title': 'Art',
      'selected': false,
    },
    {
      'icon': Icons.travel_explore_outlined,
      'title': 'Traveling',
      'selected': false,
    },
    {
      'icon': Icons.paragliding_outlined,
      'title': 'Extreme',
      'selected': false,
    },
    {
      'icon': Icons.music_note_outlined,
      'title': 'Music',
      'selected': false,
    },
    {
      'icon': Icons.wine_bar_outlined,
      'title': 'Drink',
      'selected': false,
    },
    {
      'icon': Icons.videogame_asset,
      'title': 'Video games',
      'selected': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        // isPadding: false,
        Padding: EdgeInsets.only(
          top: 10,
          right: 15,
          left: 15,
        ),
        widget: Scaffold(
          backgroundColor: Colors.transparent,
          body: ListView(physics: NeverScrollableScrollPhysics(), children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 52,
                  height: 52,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFFE8E6EA)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  child: Icon(Icons.arrow_back_ios_new_outlined),
                ),
                TextButton(
                    onPressed: () async {
                      await CacheMangement().setCurrentScreen(2);

                      Navigator.pushReplacementNamed(context, Routes.homePage);
                    },
                    child: Text(
                      'Skip',
                      style: TextStyle(
                        color: Color(0xFF4B164C),
                        fontSize: 16,
                        fontFamily: 'DM Sans',
                        fontWeight: FontWeight.w700,
// height: 0.09,
                      ),
                    ))
              ],
            ),
            SizedBox(height: 10),
            Text(
              'Your interests',
              style: TextStyle(
                color: Colors.black,
                fontSize: 34,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w700,
                // height: 0.04,
              ),
            ),
            Text(
              'Select a few of your interests and let everyone know what you’re passionate about.',
              style: TextStyle(
                color: Colors.black.withOpacity(0.699999988079071),
                fontSize: 14,
                fontFamily: 'DM Sans',
                fontWeight: FontWeight.w400,
                // height: 0.11,
              ),
            ),
            SizedBox(height: 16),
            GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2.6 / 1,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 8),
                itemCount: 14,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        data[index]['selected'] = !data[index]['selected'];
                      });
                    },
                    child: Container(
                      width: 140,
                      height: 45,
                      padding: EdgeInsets.all(8.0),
                      decoration: ShapeDecoration(
                        color: data[index]['selected'] == true
                            ? AllCOlors.purple
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFE8E6EA)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Icon(data[index]['icon'],
                                size: 30,
                                color: data[index]['selected'] == true
                                    ? Colors.white
                                    : AllCOlors.purple),

                            // Icon(
                            //   data[index]['icon'],
                            //   size: 30,
                            // ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              data[index]['title'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: data[index]['selected'] == true
                                      ? Colors.white
                                      : AllCOlors.purple),
                            )
                          ]),
                    ),
                  );
                }),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () async {
                  List interests = [];
                  for (Map i in data) {
                    if (i['selected'] == true) {
                      interests.add(i['title'].toLowerCase());
                    }
                  }
                  print(interests);
                  bool done = await ProfileDetailAPI().addInterests(interests);
                  if (done == true) {
                    await CacheMangement().setIsCompleted(true);
                    await CacheMangement().setCurrentScreen(0);
                    Navigator.pushReplacementNamed(context, Routes.homePage);
                  }
                },
                child: Text('Continue'))
          ]),
        ));
  }
}
