import 'package:flutter/material.dart';
import 'package:saving_app/views/main_view.dart';

void main() {
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
