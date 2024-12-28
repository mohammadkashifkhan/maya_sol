import 'package:maya_sol/persistence/model/transaction.dart';

import '../domain/view_history_repository.dart';

class ViewHistoryViewModel {
  ViewHistoryViewModel(this._viewHistoryRepository);

  final ViewHistoryRepository _viewHistoryRepository;

  bool _isLoading = false;
  List<Transaction> _userListModel = [];
  String _error = "";

  get isLoading => _isLoading;

  get data => _userListModel;

  get error => _error;

  Future<List<Transaction>> viewHistory() {
    return _viewHistoryRepository.getAllTransactions();
  }
}
