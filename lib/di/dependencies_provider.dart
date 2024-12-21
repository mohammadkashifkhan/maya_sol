import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:maya_sol/features/auth/data/auth_repository_impl.dart';
import 'package:maya_sol/features/auth/domain/auth_repository.dart';
import 'package:maya_sol/features/auth/presentation/auth_view_model.dart';
import 'package:maya_sol/features/home/data/home_repository_impl.dart';
import 'package:maya_sol/features/home/presentation/home_view_model.dart';
import 'package:maya_sol/features/send_money/data/send_money_repository_impl.dart';
import 'package:maya_sol/features/send_money/domain/send_money_repository.dart';
import 'package:maya_sol/features/send_money/presentation/send_money_view_model.dart';
import 'package:maya_sol/features/view_history/data/view_history_repository_impl.dart';
import 'package:maya_sol/features/view_history/domain/view_history_repository.dart';
import 'package:maya_sol/features/view_history/presentation/view_history_view_model.dart';
import 'package:maya_sol/persistence/session_manager.dart';
import 'package:maya_sol/persistence/transactions_db.dart';
import '../features/home/domain/home_repository.dart';

final dbProvider =
    FutureProvider<TransactionsDb>((_) => TransactionsDb.create());

final sessionProvider =
    FutureProvider<SessionManager>((_) => SessionManager.create());

// auth
final authRepositoryProvider = Provider<AuthRepository>((ref) =>
    AuthRepositoryImpl(
        ref.watch(sessionProvider as ProviderListenable<SessionManager>)));
final authViewModelProvider =
    StateNotifierProvider<AuthViewModel, bool>((ref) => AuthViewModel(ref));

// home
final homeRepositoryProvider = Provider<HomeRepository>((ref) =>
    HomeRepositoryImpl(
        ref.watch(dbProvider as ProviderListenable<TransactionsDb>)));
final homeViewModelProvider =
    StateNotifierProvider<HomeViewModel, bool>((ref) => HomeViewModel(ref));

// send money
final sendMoneyRepositoryProvider = Provider<SendMoneyRepository>((ref) =>
    SendMoneyRepositoryImpl(
        ref.watch(dbProvider as ProviderListenable<TransactionsDb>)));
final sendMoneyViewModelProvider =
    StateNotifierProvider<SendMoneyViewModel, bool>(
        (ref) => SendMoneyViewModel(ref));

// view History
final viewHistoryRepositoryProvider = Provider<ViewHistoryRepository>((ref) =>
    ViewHistoryRepositoryImpl(
        ref.watch(dbProvider as ProviderListenable<TransactionsDb>)));
final viewHistoryViewModelProvider =
    StateNotifierProvider<ViewHistoryViewModel, bool>(
        (ref) => ViewHistoryViewModel(ref));
