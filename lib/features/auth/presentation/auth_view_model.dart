import '../domain/auth_repository.dart';

class AuthViewModel {
  AuthViewModel(this._authRepository) {}
  final AuthRepository _authRepository;

  Future<bool> doLogin(String userName, String pwd) {
    var isSuccess = _authRepository.login(userName, pwd);
    return isSuccess;
  }
}
