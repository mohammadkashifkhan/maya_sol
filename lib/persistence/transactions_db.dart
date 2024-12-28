import 'package:hive/hive.dart';

import '../utils/constants.dart';
import 'model/transaction.dart';

abstract class TransactionsDb {
  List<Transaction> getAllTransactions();

  addTransaction(Transaction transaction);

  deleteTransaction(int index);
}

class TransactionsDbImpl extends TransactionsDb {
  late Box<Transaction> _transactionBox;

  TransactionsDbImpl() {
    _transactionBox = Hive.box<Transaction>(hive_box_name);
  }

  addTransaction(Transaction transaction) {
    _transactionBox.add(transaction);
  }

  List<Transaction> getAllTransactions() {
    return _transactionBox.values.toList();
  }

  deleteTransaction(int index) {
    _transactionBox.deleteAt(index);
  }

  void deleteAll() {
    _transactionBox.clear();
  }
}
