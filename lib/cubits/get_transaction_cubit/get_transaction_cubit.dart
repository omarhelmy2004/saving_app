import 'package:bloc/bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saving_app/cubits/get_transaction_cubit/get_transaction_state.dart';
import 'package:saving_app/constants/strings.dart';
import 'package:saving_app/models/transaction_model.dart';


class GetTransactionsCubit extends Cubit<GetTransactionsState> {
  GetTransactionsCubit() : super(GetTransactionsInitial());

  Future<void> getTransactions(int selectedIndex) async {
    try {
      emit(GetTransactionsLoading());

      // Open the Hive box
      var transactionsBox = Hive.box<TransactionModel>(kTransactionsBox);

      // Get all transactions from the box
      List<TransactionModel> transactions =
          transactionsBox.values.toList().cast<TransactionModel>();

      // Filter transactions based on the selected index
      if (selectedIndex == 1) {
        // Filter for outcome transactions (type == 0)
        transactions =
            transactions.where((transaction) => transaction.transactionType == 0).toList();
      } else if (selectedIndex == 2) {
        // Filter for income transactions (type == 1)
        transactions =
            transactions.where((transaction) => transaction.transactionType == 1).toList();
      }

      // Sort transactions by date (newest first)
      transactions.sort((a, b) => b.date.compareTo(a.date));

      // Emit success state with the filtered and sorted transactions
      emit(GetTransactionsSuccess(transactions));
    } catch (e) {
      // Emit failure state if an error occurs
      emit(GetTransactionsFailure(
          'Failed to fetch transactions: ${e.toString()}'));
    }
  }
}

