import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:saving_app/constants/strings.dart';
import 'package:saving_app/views/main_view.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(kTransactionsBox);
  await Hive.openBox(kBudgetsBox);
  await Hive.openBox(kGoalsBox);
  runApp(const SavingApp());
}

class SavingApp extends StatelessWidget {
  const SavingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      routes: {
        'HomePage': (context) => const MainView(),
      },
      initialRoute: 'HomePage',
    );
  }
}
