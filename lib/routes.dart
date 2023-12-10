import 'package:trills/pages/home/mobile_screen_layout.dart';
import 'package:trills/pages/home/pages/homePage.dart';


import 'package:trills/pages/message/widget/messages_page.dart';
import 'package:trills/pages/splash_screen.dart';


import 'package:trills/pages/venue/pages/meetup_page.dart';

import 'package:trills/post/pages/add_post_page.dart';

import 'pages/gender/pages/gender_page.dart';
import 'pages/home/pages/view_stories_page.dart';
import 'pages/interests/pages/interests_page.dart';
import 'pages/login/pages/login_page.dart';
import 'pages/login/pages/register_page.dart';
import 'pages/matches/pages/matches_page.dart';
import 'pages/profile/pages/profile_page.dart';
import 'pages/profile_detail/profile_detail_page.dart';
import 'pages/venue/pages/reserve_page.dart';
import 'pages/venue/pages/venue_page.dart';

class Routes {
  static final allRoutes = {

    homePage: (_) => const MobileScreenLayout(),
    splashScreen: (_) => const SplashScreen(),
    matchesPage: (_) => const MatchesPage(),
    profilePage: (_) => ProfilePage(),
    messagePage: (_) => const MessagesPage(),
    viewStoryPage: (_) => ViewStoryPage(),
    interestPage: (_) => InterestsPage(),
    venuePage: (_) => const VenuePage(),
    genderPage: (_) => const GenderSelectPage(),
    reservePage: (_) => const ReservePage(),
    loginPage: (_) => LoginPage(),
    profileDetailPage: (_) => const ProfileDetailPage(),
    signUpPage: (_) => SignUpPage(),
    addPostPage: (_) => const AddPostPage(),

    meetupPage: (_) => const MeetupPage()

  };

  static const String homePage = 'home-page';
  static const String splashScreen = 'splash-Screen';
  static const String matchesPage = 'matches-page';
  static const String profilePage = 'profile-page';
  static const String loginPage = 'login-page';
  static const String signUpPage = 'sign-up-page';
  static const String messagePage = 'message-page';
  static const String viewStoryPage = 'view-story-page';
  static const String interestPage = 'interest-page';
  static const String venuePage = 'venue-page';
  static const String genderPage = 'gender-page';
  static const String reservePage = 'reserve-page';
  static const String profileDetailPage = 'profile-detail-page';
  static const String addPostPage = 'add-post-page';
  static const String meetupPage = 'meetup-page';
}
