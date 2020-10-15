import 'package:shared_preferences/shared_preferences.dart';

class HelperFunc {
  static String loggedInKey = "LOGGEDINKEY";

  static Future<bool> saveUserloggedIn(bool isUserLoggedIn) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return await pref.setBool(loggedInKey, isUserLoggedIn);
  }

  static Future<bool> getUserloggedIn() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    return pref.getBool(loggedInKey);
  }
}