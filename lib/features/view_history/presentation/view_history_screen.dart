import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maya_sol/features/view_history/presentation/view_history_view_model.dart';

import '../../../di/dependencies_provider.dart';
import '../../../utils/constants.dart';
import '../../../utils/routes.dart';

class ViewHistoryScreen extends ConsumerStatefulWidget {
  ViewHistoryScreen({super.key});

  @override
  ConsumerState<ViewHistoryScreen> createState() => _ViewHistoryScreenState();
}

class _ViewHistoryScreenState extends ConsumerState<ViewHistoryScreen> {
  @override
  Widget build(BuildContext context) {
    var sessionManager = ref.read(sessionProvider);
    var viewHistoryViewModel = ref.read(viewHistoryViewModelProvider);
    return Scaffold(
      appBar: AppBar(title: Text(title_view_transactions), actions: [
        IconButton(
            onPressed: () {
              sessionManager.logout();
              Navigator.pushNamedAndRemoveUntil(context, auth, (r) => false);
            },
            icon: Icon(Icons.logout))
      ]),
      body: _showUI(viewHistoryViewModel),
    );
  }

  _showUI(ViewHistoryViewModel viewHistoryViewModel) {
    if (viewHistoryViewModel.isLoading) {
      return Container(
        child: CircularProgressIndicator(),
      );
    }
    if (viewHistoryViewModel.error.isNotEmpty) {
      return Container(
        child: Text(viewHistoryViewModel.error),
      );
    }
    return FutureBuilder(
      future: viewHistoryViewModel.viewHistory(),
      builder: (context, dataSnapshot) {
        if (dataSnapshot.connectionState == ConnectionState.done) {
          return ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: dataSnapshot.data?.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                              style: TextStyle(fontSize: 20),
                              dataSnapshot.data?[index].recipient ?? ''),
                          Text(
                              style: TextStyle(color: Colors.black),
                              "${dataSnapshot.data?[index].amount.toString() ??
                                  ''} php"),
                        ],
                      ),
                      Text(
                          style: TextStyle(fontSize: 10),
                          dataSnapshot.data?[index].dateTime ?? ''),
                      const SizedBox(height: 16),
                    ],
                  ),
                );
              });
        } else
          return Container();
      },
    );
  }
}
