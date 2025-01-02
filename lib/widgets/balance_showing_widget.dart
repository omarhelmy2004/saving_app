import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:saving_app/cubits/get_balance_cubit/get_balance_cubit.dart';
import 'package:saving_app/cubits/get_balance_cubit/get_balance_state.dart';
import 'package:saving_app/widgets/bold_text.dart';

class BalanceShowingWidget extends StatelessWidget {
  const BalanceShowingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetBalanceCubit>(context).getBalance();
    return BlocBuilder<GetBalanceCubit, GetBalanceState>(
      builder: (context, state) {
        if (state is GetBalanceLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is GetBalanceFailure) {
          return Center(child: Text(state.errorMessage));
        }
        if (state is GetBalanceSuccess){
          return BoldText(text: '\$${BlocProvider.of<GetBalanceCubit>(context).totalBalance.toString()}', fontSize: 40,);
        }
         return const Center(child: Text('Unexpected Erorr'));
      },);
  }
}