import 'package:maya_sol/persistence/model/transaction.dart';

abstract class ViewHistoryRepository {
  //read
  Future<List<Transaction>> getAllTransactions();

  //delete
  Future<void> deleteTransaction(int index);
}
