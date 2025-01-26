import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:saving_app/constants/strings.dart';
import 'package:saving_app/models/balance_model.dart';
import 'package:saving_app/models/transaction_model.dart';

part 'add_transaction_state.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  AddTransactionCubit() : super(AddTransactionInitial());
  
  Future<void> addTransaction(TransactionModel transactionModel) async {
    try {
      Balance balance;
      double transactionAmount = transactionModel.amount;

       double totalBalance = 0 ;
      // Open the Hive box
      var transactionsBox = Hive.box<TransactionModel>(kTransactionsBox);

      var balanceBox = Hive.box<Balance>(kBalance);

        if (balanceBox.isEmpty) {
         balance = Balance(totalBalance: 0);

         totalBalance = balance.totalBalance;
        }
         else {
          balance = balanceBox.getAt(0)!;

          totalBalance = balance.totalBalance;

          await balanceBox.deleteAt(0);
         
         }
      
        if (transactionModel.transactionType == 0) {
          balance.totalBalance = totalBalance - transactionAmount;
        } else {
        balance.totalBalance = totalBalance + transactionAmount;
        }

        await balanceBox.add(balance);

        

      

      // Add the transaction to the box
      await transactionsBox.add(transactionModel);

      // Emit success state
      emit(AddTransactionSuccess());
    } catch (e) {
      // Emit error state if something goes wrong
      emit(AddTransactionFailure("Failed to add transaction: ${e.toString()}"));
    }
  }
 
}
