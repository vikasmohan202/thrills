import 'package:flutter/material.dart';
import 'package:trills/all_colors.dart';
import 'package:trills/background.dart';
import 'package:trills/cache_magement.dart';
import 'package:trills/pages/home/pages/homePage.dart';
import 'package:trills/pages/message/widget/messages_page.dart';
import 'package:trills/pages/profile/pages/profile_page.dart';
import 'package:trills/pages/profile_detail/profile_detail_page.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {
  int _page = 0;
  late PageController pageController; // for tabs animation
  List<Widget> homeScreenItems = [HomePage(), ProfilePage(), MessagesPage()];

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  void navigationTapped(int page) {
    //Animating Page
    pageController.jumpToPage(page);
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundWidget(
        widget: Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: homeScreenItems,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: (_page == 0)
                  ? Colors
                      .black //Color.fromARGB(255, 243, 136, 172).withOpacity(.5)
                  : ColorPallate.secondaryColor,
            ),
            label: '',
            backgroundColor: ColorPallate.primaryColor,
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                color:
                    (_page == 1) ? Colors.black : ColorPallate.secondaryColor,
              ),
              label: '',
              backgroundColor: ColorPallate.primaryColor),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle,
                color:
                    (_page == 2) ? Colors.black : ColorPallate.secondaryColor,
              ),
              label: '',
              backgroundColor: ColorPallate.primaryColor),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.favorite,
              color: (_page == 3) ? Colors.black : ColorPallate.secondaryColor,
            ),
            label: '',
            backgroundColor: ColorPallate.primaryColor,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person,
              color: (_page == 4) ? Colors.black : ColorPallate.secondaryColor,
            ),
            label: '',
            backgroundColor: ColorPallate.primaryColor,
          ),
        ],
        onTap: navigationTapped,
        currentIndex: _page,
      ),
    ));
  }
}
