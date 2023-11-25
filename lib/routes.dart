import 'package:trills/pages/home/pages/homePage.dart';
import 'package:trills/pages/message/pages/messages_page.dart';

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
    homePage: (_) => HomePage(),
    matchesPage: (_) => MatchesPage(),
    profilePage: (_) => ProfilePage(),
    messagePage: (_) => MessagesPage(),
    viewStoryPage: (_) => ViewStoryPage(),
    interestPage: (_) => InterestsPage(),
    venuePage: (_) => VenuePage(),
    genderPage: (_) => GenderSelectPage(),
    reservePage: (_) => ReservePage(),
    loginPage: (_) => LoginPage(),
    profileDetailPage: (_) => ProfileDetailPage(),
    signUpPage: (_) => SignUpPage(),
  };

  static const String homePage = 'home-page';
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
}
