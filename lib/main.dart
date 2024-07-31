import 'package:flutter/material.dart';
import 'package:saving_app/views/home_view.dart';

void main() {
  runApp(const SavingApp());
}

class SavingApp extends StatelessWidget {
  const SavingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        'HomePage': (context) => const HomeView(),
      },
      initialRoute: 'HomePage',
    );
  }
}
