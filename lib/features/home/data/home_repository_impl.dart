import 'package:maya_sol/persistence/transactions_db.dart';

import '../domain/home_repository.dart';

class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(this._transactionsDb);

  late TransactionsDb _transactionsDb;

  @override
  Future<num> getCurrentBalance() async {
    var currentBalance = _transactionsDb
        .getAllTransactions()
        .fold<num>(0, (prev, element) => prev + element.amount);
    return Future<num>.value(currentBalance);
  }
}
