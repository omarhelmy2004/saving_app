import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:meta/meta.dart';
import 'package:saving_app/constants/strings.dart';
import 'package:saving_app/models/income_transaction_model.dart';
import 'package:saving_app/models/outcome_transaction_model.dart';

part 'add_transaction_state.dart';

class AddTransactionCubit extends Cubit<AddTransactionState> {
  AddTransactionCubit() : super(AddTransactionInitial());

  Future<void> addOutComeTransaction(OutcomeModel outcomeModel) async {
    try {
      // Open the Hive box
      var transactionsBox = Hive.box(kTransactionsBox);

      // Add the transaction to the box
      await transactionsBox.add(outcomeModel);

      // Emit success state
      emit(AddTransactionSuccess());
    } catch (e) {
      // Emit error state if something goes wrong
      emit(AddTransactionFailure("Failed to add transaction: ${e.toString()}"));
    }
  }
  Future<void> addInComeTransaction(IncomeModel incomeModel) async {
    try {
      // Open the Hive box
      var transactionsBox = Hive.box(kTransactionsBox);

      // Add the transaction to the box
      await transactionsBox.add(incomeModel);

      // Emit success state
      emit(AddTransactionSuccess());
    } catch (e) {
      // Emit error state if something goes wrong
      emit(AddTransactionFailure("Failed to add transaction: ${e.toString()}"));
    }
  }
}
