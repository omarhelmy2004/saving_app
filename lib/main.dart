import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saving_app/constants/strings.dart';
import 'package:saving_app/cubits/get_balance_cubit/get_balance_cubit.dart'; 
import 'package:saving_app/cubits/get_transaction_cubit/get_transaction_cubit.dart';
import 'package:saving_app/models/balance_model.dart';
import 'package:saving_app/models/budget_model.dart';
import 'package:saving_app/models/goals_model.dart';
import 'package:saving_app/models/transaction_model.dart';
import 'package:saving_app/views/main_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';





void main() async {
  await Hive.initFlutter();
  
  Hive.registerAdapter(BudgetModelAdapter());
  Hive.registerAdapter(GoalsModelAdapter());
  Hive.registerAdapter(TransactionModelAdapter());
  Hive.registerAdapter(BalanceAdapter());
 
  await Hive.openBox<Balance>(kBalance);
  await Hive.openBox<TransactionModel>(kTransactionsBox);
  await Hive.openBox(kBudgetsBox);
  await Hive.openBox(kGoalsBox);
  runApp(const SavingApp());
}

class SavingApp extends StatelessWidget {
  const SavingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => GetTransactionsCubit(),
        ),
        BlocProvider(
          create: (context) => GetBalanceCubit(),
        ),
      ],
      
    
      child: MaterialApp(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routes: {
          'HomePage': (context) => const MainView(),
        },
        initialRoute: 'HomePage',
      ),
    );
  }
}
