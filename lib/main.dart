import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saving_app/constants/strings.dart';
import 'package:saving_app/cubits/add_transaction_cubit/add_transaction_cubit.dart';
import 'package:saving_app/models/budget_model.dart';
import 'package:saving_app/models/goals_model.dart';
import 'package:saving_app/models/income_transaction_model.dart';
import 'package:saving_app/models/outcome_transaction_model.dart';
import 'package:saving_app/views/main_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kTransactionsBox);
  await Hive.openBox(kBudgetsBox);
  await Hive.openBox(kGoalsBox);
  Hive.registerAdapter(BudgetModelAdapter());
  Hive.registerAdapter(GoalsModelAdapter());
  Hive.registerAdapter(IncomeModelAdapter());
  Hive.registerAdapter(OutcomeModelAdapter());
  runApp(const SavingApp());
}

class SavingApp extends StatelessWidget {
  const SavingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AddTransactionCubit(),
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
