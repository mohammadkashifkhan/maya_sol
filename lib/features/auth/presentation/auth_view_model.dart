import '../domain/auth_repository.dart';

class AuthViewModel {
  AuthViewModel(this._authRepository) {}
  final AuthRepository _authRepository;

  Future<bool> doLogin(String userName, String pwd) {
    return _authRepository.login(userName, pwd);
  }
}
