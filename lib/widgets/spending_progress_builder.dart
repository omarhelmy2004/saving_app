import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saving_app/cubits/get_transaction_cubit/get_transaction_cubit.dart';
import 'package:saving_app/cubits/get_transaction_cubit/get_transaction_state.dart';
import 'package:saving_app/widgets/spending_progress.dart';


class SpendingProgressBuilder extends StatelessWidget {
  const SpendingProgressBuilder({
    super.key,
  });
  
  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetTransactionsCubit>(context).getSpending();
    // return SpendingProgressWidget(spendingAmount: 123,);
    return BlocBuilder<GetTransactionsCubit, GetTransactionsState>(
      builder: (context, state) {
        if (state is GetTransactionsLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetTransactionsFailure) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is  GetTransactionsSuccess){
          return SpendingProgressWidget(spendingAmount: BlocProvider.of<GetTransactionsCubit>(context).spendingAmount,);
        }
         return const Center(child: Text('Unexpected Erorr'));
      },);
  }
}