import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maya_sol/di/dependencies_provider.dart';
import 'package:maya_sol/persistence/model/transaction.dart';

import '../data/send_money_repository_impl.dart';

class SendMoneyViewModel extends StateNotifier<bool> {
  SendMoneyViewModel(this._ref) : super(false) {
    _sendMoneyRepositoryImpl = _ref.read(sendMoneyRepositoryProvider as ProviderListenable<SendMoneyRepositoryImpl>);
  }
  late SendMoneyRepositoryImpl _sendMoneyRepositoryImpl;
  final StateNotifierProviderRef _ref;

  Future<void> sendMoney(String name, int amount) {
    DateTime now = DateTime.now();
    Transaction transaction = Transaction(recipient: name, amount: amount, dateTime: "${now.hour}:${now.minute}:${now.second}");
    return _sendMoneyRepositoryImpl.addTransaction(transaction);
  }
}