import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maya_sol/di/dependencies_provider.dart';
import 'package:maya_sol/utils/constants.dart';
import 'package:maya_sol/utils/routes.dart';


class HomeScreen extends ConsumerStatefulWidget {
  HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title_home), actions: [
        IconButton(
            onPressed: () {
              ref.read(sessionProvider).logout();
              Navigator.pushNamedAndRemoveUntil(context, auth, (r) => false);
            },
            icon: Icon(Icons.logout))
      ]),
      body: FutureBuilder(
        future: Future.wait([ref.read(sessionProvider).getUserName(), ref.watch(homeViewModelProvider).getCurrentBalance()]),
        builder: (context, AsyncSnapshot<List<dynamic>> dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.done) {
              return Center(
                  child: Column(
                    children: [
                      Row(
                        children: [Text('Username'), Text(dataSnapshot.data?[0] ?? '')],
                      ),
                      Text('${dataSnapshot.data?[1].toString() ?? 0} php'),
                      FilledButton(
                          onPressed: () {
                            Navigator.pushNamed(context, send_money);
                          },
                          child: Text('Send Money')),
                      FilledButton(
                          onPressed: () {
                            Navigator.pushNamed(context, view_history);
                          },
                          child: Text('View Transactions'))
                    ],
                  ));
          } else
            return Container();
        },
      ),
    );
  }
}
