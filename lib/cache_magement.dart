


//This wrapper over SharedPreferences is needed as flutter doesn't provide
//non-async method for getting preferences. This is becoming a problem as
//at some places getting pref in constructor is required and constructors
//can't be async in flutter.
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefUtil {
  static late final SharedPreferences preferences;
  static bool _init = false;
  static Future init() async {
    if (_init) return;
    preferences = await SharedPreferences.getInstance();
    _init = true;
    return preferences;
  }


  static void logIn(companyId, userRole, mobile, domain) {
   
  }

  static void addLoggedInUserNameAndCompanyImage(userName, image) {
  
  }

  static void logOut() {
  
  }

  static setValue(String key, Object value) {
    switch (value.runtimeType) {
      case String:
        preferences.setString(key, value as String);
        break;
      case bool:
        preferences.setBool(key, value as bool);
        break;
      case int:
        preferences.setInt(key, value as int);
        break;
      default:
        throw Exception("Not implemented.");
    }
  }

  static clearValue(String key) {
    preferences.remove(key);
  }

  static Object getValue(String key, Object defaultValue) {
    switch (defaultValue.runtimeType) {
      case String:
        return preferences.getString(key) ?? defaultValue;
      case bool:
        return preferences.getBool(key) ?? defaultValue as bool;
      case int:
        return preferences.getInt(key) ?? defaultValue as int;
      default:
        return defaultValue;
    }
  }

 

 

 
}
