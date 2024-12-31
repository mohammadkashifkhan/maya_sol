import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maya_sol/components/CustomTextField.dart';
import 'package:maya_sol/di/dependencies_provider.dart';
import 'package:maya_sol/features/send_money/presentation/send_money_view_model.dart';

import '../../../utils/constants.dart';
import '../../../utils/routes.dart';

class SendMoneyScreen extends ConsumerWidget {
  SendMoneyScreen({super.key});

  late SendMoneyViewModel sendMoneyViewModel;
  final moneyController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    sendMoneyViewModel = ref.watch(sendMoneyViewModelProvider);
    var sessionManager = ref.read(sessionProvider);
    return Scaffold(
      appBar: AppBar(title: Text(title_send_money), actions: [
        IconButton(
            onPressed: () {
              sessionManager.logout();
              Navigator.pushNamedAndRemoveUntil(context, auth, (r) => false);
            },
            icon: Icon(Icons.logout))
      ]),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CustomTextField(
              controller: moneyController,
              obscure: false,
              hint: enter_amount,
              type: TextInputType.number),
          const SizedBox(height: 56),
          FilledButton(
              style:
                  FilledButton.styleFrom(backgroundColor: Colors.blue.shade700),
              onPressed: () {
                sendMoneyViewModel.sendMoney("Test", moneyController.text);
                showModalBottomSheet(
                    context: context,
                    isDismissible: false,
                    constraints: BoxConstraints(
                      minWidth: 600,
                      minHeight: 300,
                      maxHeight: 300,
                    ),
                    builder: (BuildContext context) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(success),
                          FilledButton(
                              style: FilledButton.styleFrom(
                                  backgroundColor: Colors.blue.shade700),
                              onPressed: () {
                                Navigator.pop(context);
                                Navigator.pushNamedAndRemoveUntil(
                                    context, home, (r) => false);
                              },
                              child: Text(close))
                        ],
                      );
                    });
              },
              child: const Text(submit))
        ],
      ),
    );
  }
}
