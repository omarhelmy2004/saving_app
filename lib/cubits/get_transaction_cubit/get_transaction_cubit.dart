import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saving_app/cubits/get_transaction_cubit/get_transaction_state.dart';
import 'package:saving_app/models/income_transaction_model.dart';
import 'package:saving_app/models/outcome_transaction_model.dart';
import 'package:saving_app/constants/strings.dart';

class GetTransactionsCubit extends Cubit<GetTransactionsState> {
  GetTransactionsCubit() : super(GetTransactionsInitial());

  Future<void> getTransactions(int selectedIndex) async {
    try {
      emit(GetTransactionsLoading());

      // Open the shared Hive box for both income and outcome transactions
      var transactionsBox = await Hive.openBox(kTransactionsBox);

      List<dynamic> transactions = transactionsBox.values.toList();

      // Filter transactions based on the selected index
      if (selectedIndex == 1) {
        // Filter for outcome transactions (assumes a way to distinguish between them)
        transactions = transactions.where((t) => t is OutcomeModel).toList();
      } else if (selectedIndex == 2) {
        // Filter for income transactions (assumes a way to distinguish between them)
        transactions = transactions.where((t) => t is IncomeModel).toList();
      } else {
        // No filtering, show both income and outcome transactions
        transactions = transactions;
      }

      // Sort transactions if needed (e.g., by date)
      transactions.sort((a, b) => b.date.compareTo(a.date));  // Assuming 'date' is a field in both models

      emit(GetTransactionsSuccess(transactions));
    } catch (e) {
      emit(GetTransactionsFailure('Failed to fetch transactions: ${e.toString()}'));
    }
  }
}
