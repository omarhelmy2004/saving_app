// get_transaction_state.dart
import 'package:meta/meta.dart';
import 'package:saving_app/models/transaction_model.dart';

@immutable
sealed class GetTransactionsState {}

final class GetTransactionsInitial extends GetTransactionsState {}

final class GetTransactionsLoading extends GetTransactionsState {}

final class GetTransactionsSuccess extends GetTransactionsState {
  final List<TransactionModel> transactions;  // List to hold the transactions

  GetTransactionsSuccess(this.transactions);
}

final class GetTransactionsFailure extends GetTransactionsState {
  final String errorMessage;

  GetTransactionsFailure(this.errorMessage);
}
