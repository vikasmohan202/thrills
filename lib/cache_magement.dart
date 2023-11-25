import 'package:shared_preferences/shared_preferences.dart';

class CacheMangement {
  getIsCompleted() async {
    final prefs = await SharedPreferences.getInstance();
    if (prefs.getBool('isCompleted') == null) {
      return false;
    }

    return prefs.getBool('isCompleted');
  }

  setIsCompleted(bool isCompleted) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isCompleted', isCompleted);
  }

  getCurrentScreen() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('currentScreen');
  }

  setCurrentScreen(int currentScreen) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('currentScreen', currentScreen);
  }
}
