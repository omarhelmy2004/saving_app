import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saving_app/cubits/get_transaction_cubit/get_transaction_cubit.dart';
import 'package:saving_app/cubits/get_transaction_cubit/get_transaction_state.dart';
import 'package:saving_app/models/transaction_model.dart';
import 'package:saving_app/widgets/custom_row_with_text_and_label.dart';
import 'package:saving_app/widgets/empty_indicator.dart';
import 'package:saving_app/widgets/scroll_configuration.dart';

class TransactionsWidget extends StatelessWidget {
  final int selectedIndex;
  final int? listViewLength;
  const TransactionsWidget({super.key, required this.selectedIndex,  this.listViewLength});
  int listViewChecker(int transactionListCount){
    if (listViewLength == null ) {
      return transactionListCount;
    }
    else if (listViewLength! > transactionListCount){
      return transactionListCount;
    }
    else {
      return listViewLength!;
    }
  }
  @override
  Widget build(BuildContext context) {
    // Fetch transactions when the widget is built
    
    BlocProvider.of<GetTransactionsCubit>(context).getTransactions(selectedIndex);

    return BlocBuilder<GetTransactionsCubit, GetTransactionsState>(
      
      builder: (context, state) {
        if (state is GetTransactionsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetTransactionsFailure) {
          return Center(child: Text(state.errorMessage));
        }

        if (state is GetTransactionsSuccess) {
           print('Transactions fetched: ${state.transactions.length}');
          List<TransactionModel> transactions = state.transactions;
          // List<TransactionModel> transactions = BlocProvider.of<GetTransactionsCubit>(context).transactions;
          if (transactions.isEmpty) {
            return Padding(
              padding: const EdgeInsets.only(top: 10.0, bottom: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: EmptyIndicator()),
                ],
              ),
            );
          }

          return CustomScrollConfiguration(
            child: ListView.builder(
              itemCount: listViewChecker(transactions.length),
              itemBuilder: (context, index) {
                return CustomRowWithTextAndLabel(
                  topText: transactions[index].category,
                   textLeft: transactions[index].date.toString(),
                  textRight: '\$${transactions[index].amount}',
                );
              },
            ),
          );
        }

        // In case of an unexpected state, just show a fallback message
        return const Center(child: Text('Unexpected state'));
      },
    );
  }
}


