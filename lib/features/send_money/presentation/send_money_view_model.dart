import 'package:maya_sol/persistence/model/transaction.dart';

import '../domain/send_money_repository.dart';

class SendMoneyViewModel {
  SendMoneyViewModel(this._sendMoneyRepository);

  final SendMoneyRepository _sendMoneyRepository;

  Future<void> sendMoney(String name, String amount) {
    DateTime now = DateTime.now();
    Transaction transaction = Transaction(
        recipient: name,
        amount: int.parse(amount),
        dateTime: "${now.hour}:${now.minute}:${now.second}");
    return _sendMoneyRepository.addTransaction(transaction);
  }
}
