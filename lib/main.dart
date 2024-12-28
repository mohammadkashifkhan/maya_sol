import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:maya_sol/di/dependencies_provider.dart';
import 'package:maya_sol/features/auth/presentation/auth_screen.dart';
import 'package:maya_sol/features/home/presentation/home_screen.dart';
import 'package:maya_sol/features/send_money/presentation/send_money_screen.dart';
import 'package:maya_sol/features/view_history/presentation/view_history_screen.dart';
import 'package:maya_sol/persistence/model/transaction.dart';
import 'package:maya_sol/utils/constants.dart';
import 'package:maya_sol/utils/routes.dart';

void main() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TransactionAdapter()); //add TypeAdapter
  await Hive.openBox<Transaction>(hive_box_name);
  runApp(ProviderScope(child: _RootConsumer()));
}

class _RootConsumer extends ConsumerStatefulWidget {
  @override
  ConsumerState<_RootConsumer> createState() => _RootConsumerState();
}

class _RootConsumerState extends ConsumerState<_RootConsumer> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
          future: ref.read(sessionProvider).getUserName(),
          builder: (context, dataSnapshot) {
            if (dataSnapshot.connectionState == ConnectionState.done) {
              if (dataSnapshot.data!.trim().isNotEmpty)
                return HomeScreen();
              else
                return AuthScreen();
            } else
              return Container();
          },
        ),
        routes: {
          auth: (context) => AuthScreen(),
          home: (context) => HomeScreen(),
          send_money: (context) => SendMoneyScreen(),
          view_history: (context) => ViewHistoryScreen(),
        });
  }
}
