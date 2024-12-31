import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maya_sol/features/auth/data/auth_repository_impl.dart';
import 'package:maya_sol/features/auth/domain/auth_repository.dart';
import 'package:maya_sol/features/auth/presentation/auth_view_model.dart';
import 'package:maya_sol/features/home/data/home_repository_impl.dart';
import 'package:maya_sol/features/home/presentation/home_view_model.dart';
import 'package:maya_sol/features/send_money/data/send_money_repository_impl.dart';
import 'package:maya_sol/features/send_money/domain/send_money_repository.dart';
import 'package:maya_sol/features/send_money/presentation/send_money_view_model.dart';
import 'package:maya_sol/features/view_history/presentation/view_history_view_model.dart';
import 'package:maya_sol/persistence/session_manager.dart';
import 'package:maya_sol/persistence/transactions_db.dart';

import '../features/home/domain/home_repository.dart';
import '../features/view_history/data/view_history_repository_impl.dart';
import '../features/view_history/domain/view_history_repository.dart';

final dbProvider = Provider<TransactionsDb>((_) => TransactionsDbImpl());

final sessionProvider = Provider<SessionManager>((_) => SessionManagerImpl());

// auth
final authRepositoryProvider = Provider<AuthRepository>(
  (ref) {
    final SessionManager sessionManager = ref.watch(sessionProvider);
    return AuthRepositoryImpl(sessionManager);
  },
);

final authViewModelProvider = Provider<AuthViewModel>(
  (ref) {
    final AuthRepository authRepository = ref.watch(authRepositoryProvider);
    return AuthViewModel(authRepository);
  },
);

// home
final homeRepositoryProvider = Provider<HomeRepository>(
  (ref) {
    final TransactionsDb transactionsDb = ref.watch(dbProvider);
    return HomeRepositoryImpl(transactionsDb);
  },
);

final homeViewModelProvider = Provider<HomeViewModel>(
  (ref) {
    final HomeRepository homeRepository = ref.watch(homeRepositoryProvider);
    homeRepository.getCurrentBalance().then((val) {});
    return HomeViewModel(homeRepository);
  },
);

// send money
final sendMoneyRepositoryProvider = Provider<SendMoneyRepository>(
  (ref) {
    final TransactionsDb transactionsDb = ref.watch(dbProvider);
    return SendMoneyRepositoryImpl(transactionsDb);
  },
);

final sendMoneyViewModelProvider = Provider<SendMoneyViewModel>(
  (ref) {
    final SendMoneyRepository moneyRepository =
        ref.watch(sendMoneyRepositoryProvider);
    return SendMoneyViewModel(moneyRepository);
  },
);

// view History
final viewHistoryRepositoryProvider = Provider<ViewHistoryRepository>(
  (ref) {
    final TransactionsDb transactionsDb = ref.watch(dbProvider);
    return ViewHistoryRepositoryImpl(transactionsDb);
  },
);

final viewHistoryViewModelProvider = Provider<ViewHistoryViewModel>(
  (ref) {
    final ViewHistoryRepository historyRepository =
        ref.watch(viewHistoryRepositoryProvider);
    return ViewHistoryViewModel(historyRepository);
  },
);
