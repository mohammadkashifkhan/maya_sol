import 'package:maya_sol/features/view_history/domain/view_history_repository.dart';

import '../../../persistence/model/transaction.dart';
import '../../../persistence/transactions_db.dart';

class ViewHistoryRepositoryImpl extends ViewHistoryRepository {
  ViewHistoryRepositoryImpl(this._transactionsDb);

  late TransactionsDb _transactionsDb;

  //read
  @override
  Future<List<Transaction>> getAllTransactions() async {
    return _transactionsDb.getAllTransactions();
  }

  //delete
  @override
  Future<void> deleteTransaction(int index) async {
    await _transactionsDb.deleteTransaction(index);
  }
}
