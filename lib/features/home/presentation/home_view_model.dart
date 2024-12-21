import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maya_sol/di/dependencies_provider.dart';
import 'package:maya_sol/features/home/data/home_repository_impl.dart';

class HomeViewModel extends StateNotifier<bool> {
  HomeViewModel(this._ref) : super(false) {
    _homeRepository = _ref.read(homeRepositoryProvider as ProviderListenable<HomeRepositoryImpl>);
  }
  late HomeRepositoryImpl _homeRepository;
  final StateNotifierProviderRef _ref;

  Future<num> doLogin() {
    return _homeRepository.getCurrentBalance();
  }
}