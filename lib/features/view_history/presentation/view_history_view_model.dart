import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maya_sol/di/dependencies_provider.dart';
import 'package:maya_sol/features/view_history/data/view_history_repository_impl.dart';
import 'package:maya_sol/persistence/model/transaction.dart';


class ViewHistoryViewModel extends StateNotifier<bool> {
  ViewHistoryViewModel(this._ref) : super(false) {
    _viewHistoryRepositoryImpl = _ref.read(viewHistoryRepositoryProvider as ProviderListenable<ViewHistoryRepositoryImpl>);
  }
  late ViewHistoryRepositoryImpl _viewHistoryRepositoryImpl;
  final StateNotifierProviderRef _ref;

  Future<List<Transaction>> viewHistory() {
    return _viewHistoryRepositoryImpl.getAllTransactions();
  }
}