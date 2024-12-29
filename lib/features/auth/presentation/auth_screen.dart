import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maya_sol/di/dependencies_provider.dart';
import 'package:maya_sol/features/auth/presentation/auth_view_model.dart';
import 'package:maya_sol/utils/constants.dart';
import 'package:maya_sol/utils/routes.dart';

import '../../../components/CustomTextField.dart';

class AuthScreen extends ConsumerWidget {
  AuthScreen({super.key});

  late AuthViewModel authViewModel;
  final usernameController = TextEditingController();
  final pwdController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    authViewModel = ref.watch(authViewModelProvider);
    return Scaffold(
      body: SafeArea(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center, children: [
          CustomTextField(
              controller: usernameController,
              obscure: false,
              hint: username,
              type: TextInputType.text),
          CustomTextField(
              controller: pwdController,
              obscure: true,
              hint: password,
              type: TextInputType.text),
          const SizedBox(height: 16),
          FilledButton(
              onPressed: () {
                authViewModel
                    .doLogin(usernameController.text, pwdController.text)
                    .then((isSuccess) {
                  if (isSuccess) {
                    Navigator.pushNamedAndRemoveUntil(
                        context, home, (r) => false);
                  }
                });
              },
              style: FilledButton.styleFrom(
                  backgroundColor: Colors.blue.shade700),
              child: const Text(login))
        ]),
      )
    );
  }
}
