import 'package:hive/hive.dart';

import '../constants.dart';
import 'model/transaction.dart';

class TransactionsDb {
  var _transactionBox;

  TransactionsDb._create() {}

  static Future<TransactionsDb> create() async {
    final component = TransactionsDb._create();
    await component._init();
    return component;
  }

  _init() async {
    Hive.registerAdapter(TransactionAdapter());
    _transactionBox = await Hive.openBox<Transaction>(boxName);
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
}