// get_transaction_cubit.dart
import 'package:bloc/bloc.dart';
import 'package:saving_app/cubits/get_transaction_cubit/get_transaction_state.dart';  // Ensure this is the correct import path
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saving_app/models/income_transaction_model.dart';
import 'package:saving_app/models/outcome_transaction_model.dart';

class GetTransactionsCubit extends Cubit<GetTransactionsState> {
  GetTransactionsCubit() : super(GetTransactionsInitial());

  Future<void> getTransactions(int selectedIndex) async {
    try {
      emit(GetTransactionsLoading());

      // Open Hive boxes
      final outcomeBox = await Hive.openBox<OutcomeModel>('outcomeBox');
      final incomeBox = await Hive.openBox<IncomeModel>('incomeBox');

      List<dynamic> transactions;

      // Filter transactions based on selected index
      if (selectedIndex == 1) {
        transactions = outcomeBox.values.toList();
      } else if (selectedIndex == 2) {
        transactions = incomeBox.values.toList();
      } else {
        transactions = [
          ...outcomeBox.values,
          ...incomeBox.values,
        ];
        transactions.sort((a, b) => b.date.compareTo(a.date));  // Sort by date
      }

      emit(GetTransactionsSuccess(transactions));
    } catch (e) {
      emit(GetTransactionsFailure('Failed to fetch transactions: ${e.toString()}'));
    }
  }
}
