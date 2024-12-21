import 'package:maya_sol/features/send_money/domain/send_money_repository.dart';

import '../../../persistence/model/transaction.dart';
import '../../../persistence/transactions_db.dart';

class SendMoneyRepositoryImpl extends SendMoneyRepository {
  SendMoneyRepositoryImpl(this._transactionsDb);
  late TransactionsDb _transactionsDb;

  //create
  @override
  Future<void> addTransaction(Transaction transaction) async {
    await _transactionsDb.addTransaction(transaction);
  }
}