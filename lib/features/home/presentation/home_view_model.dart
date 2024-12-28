import '../domain/home_repository.dart';

class HomeViewModel {
  HomeViewModel(this._homeRepository);

  final HomeRepository _homeRepository;

  Future<num> getCurrentBalance() {
    return _homeRepository.getCurrentBalance();
  }
}
