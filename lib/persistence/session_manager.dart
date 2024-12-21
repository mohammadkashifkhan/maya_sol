import 'package:shared_preferences/shared_preferences.dart';

import '../constants.dart' as Constants;

class SessionManager {
  var _sharedPreferences;

  SessionManager._create() {}

  static Future<SessionManager> create() async {
    final component = SessionManager._create();
    await component._init();
    return component;
  }

  _init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  //set data into shared preferences like this
  Future<void> setLogin(bool isLogin) async {
    _sharedPreferences.setBool(Constants.isLogin, isLogin);
  }

  //get value from shared preferences
  Future<bool> getLogin() async {
    return _sharedPreferences.getBool(Constants.isLogin) ?? false;
  }
}