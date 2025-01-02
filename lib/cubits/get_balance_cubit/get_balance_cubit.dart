import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saving_app/constants/strings.dart';

import 'package:saving_app/cubits/get_balance_cubit/get_balance_state.dart';
import 'package:saving_app/models/balance_model.dart';



class GetBalanceCubit extends Cubit<GetBalanceState> {
  GetBalanceCubit() : super(GetBalanceInitial());
  double totalBalance = 0;
  Future<void> getBalance () async{
  try {
  
  emit(GetBalanceLoading());

  Balance balance;

  var balanceBox = Hive.box<Balance>(kBalance);

  if (balanceBox.isEmpty) {
  balance = Balance(totalBalance: 0);
  }
 else  {
 balance = balanceBox.getAt(0)!;
}

  totalBalance = balance.totalBalance;

  emit(GetBalanceSuccess(totalBalance));

} on Exception catch (e) {
  emit(GetBalanceFailure(e.toString()));
}
  }
}
