import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart' as constants;

abstract class SessionManager {
  Future<void> clear();

  Future<void> setUserName(String userName);

  Future<String> getUserName();

  Future<void> logout();
}

class SessionManagerImpl extends SessionManager {
  late SharedPreferences _sharedPreferences;

  final Completer<SharedPreferences> initCompleter =
      Completer<SharedPreferences>();

  SessionManagerImpl() {
    initCompleter.complete(SharedPreferences.getInstance());
  }

  @override
  Future<String> getUserName() async {
    _sharedPreferences = await initCompleter.future;
    return _sharedPreferences.getString(constants.isUsername) ?? '';
  }

  @override
  Future<void> clear() async {
    _sharedPreferences = await initCompleter.future;
    await _sharedPreferences.clear();
  }

  @override
  Future<void> logout() {
    return _sharedPreferences.clear();
  }

  @override
  Future<void> setUserName(String userName) async {
    _sharedPreferences = await initCompleter.future;
    _sharedPreferences.setString(constants.isUsername, userName);
  }
}
