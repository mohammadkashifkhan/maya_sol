import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maya_sol/features/auth/data/auth_repository_impl.dart';

import '../../../di/dependencies_provider.dart';

class AuthViewModel extends StateNotifier<bool> {
  AuthViewModel(this._ref) : super(false) {
    _authRepository = _ref.read(authRepositoryProvider as ProviderListenable<AuthRepositoryImpl>);
  }
  late AuthRepositoryImpl _authRepository;
  final StateNotifierProviderRef _ref;

  Future<bool> doLogin(String userName, String pwd) {
    var isSuccess = _authRepository.login(userName, pwd);
    return isSuccess;
  }
}