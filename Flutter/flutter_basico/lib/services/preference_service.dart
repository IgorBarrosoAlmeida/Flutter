import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static final String _key = "key";

  static void save(String login) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(_key, jsonEncode({"login": login, "isAuth": true}));
  }

  static Future<bool> isAuth() async {
    var prefs = await SharedPreferences.getInstance();

    var jsonResult = prefs.getString(_key);

    if (jsonResult != null) {
      var result = jsonDecode(jsonResult);
      return result["isAuth"];
    }

    return false;
  }

  static void logout() async {
    var prefs = await SharedPreferences.getInstance();
    prefs.remove(_key);
  }
}
