import 'package:hive/hive.dart';
import 'package:maya_sol/persistence/model/transaction.dart';

abstract class SendMoneyRepository {
  //create
  Future<void> addTransaction(Transaction transaction);
}