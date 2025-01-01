import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saving_app/cubits/get_transaction_cubit/get_transaction_cubit.dart';
import 'package:saving_app/cubits/get_transaction_cubit/get_transaction_state.dart';
import 'package:saving_app/models/transaction_model.dart';
import 'package:saving_app/widgets/custom_row_with_text_and_label.dart';
import 'package:saving_app/widgets/empty_indicator.dart';

class TransactionsWidget extends StatelessWidget {
  final int selectedIndex;
  const TransactionsWidget({super.key, required this.selectedIndex});

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
                  Center(child: EmptyIndicator()),
                ],
              ),
            );
          }

          return ListView.builder(
            itemCount: transactions.length,
            itemBuilder: (context, index) {
              return CustomRowWithTextAndLabel(
                topText: transactions[index].category,
                 textLeft: transactions[index].date.toString(),
                textRight: '\$${transactions[index].amount}',
              );
            },
          );
        }

        // In case of an unexpected state, just show a fallback message
        return const Center(child: Text('Unexpected state'));
      },
    );
  }
}


