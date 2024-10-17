part of 'add_transaction_cubit.dart';

@immutable
sealed class AddTransactionState {}

final class AddTransactionInitial extends AddTransactionState {}

final class AddTransactionLoading extends AddTransactionState {}

final class AddTransactionSuccess extends AddTransactionState {}

final class AddTransactionFailure extends AddTransactionState {
  final String errMessage ;
  AddTransactionFailure(this.errMessage);
}
