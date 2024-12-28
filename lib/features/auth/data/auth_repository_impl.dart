import 'package:maya_sol/features/auth/domain/auth_repository.dart';
import 'package:maya_sol/persistence/session_manager.dart';

class AuthRepositoryImpl extends AuthRepository {
  late SessionManager _sessionManager;

  AuthRepositoryImpl(this._sessionManager);

  @override
  Future<bool> login(String username, String pwd) async {
    if (username.length > 3 && pwd.length > 3) {
      _sessionManager.setUserName(username);
      return Future<bool>.value(true);
    }
    return Future<bool>.value(false);
  }
}
