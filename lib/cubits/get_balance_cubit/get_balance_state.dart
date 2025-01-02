
import 'package:meta/meta.dart';


@immutable
sealed class GetBalanceState {}

final class GetBalanceInitial extends GetBalanceState {}

final class GetBalanceLoading extends GetBalanceState {}

final class GetBalanceSuccess extends GetBalanceState {
    final double totalBalance; 

  GetBalanceSuccess(this.totalBalance);
}

final class GetBalanceFailure extends GetBalanceState {
  final String errorMessage;

  GetBalanceFailure(this.errorMessage);
}
