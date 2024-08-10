import 'package:flutter/material.dart';
import 'package:saving_app/widgets/bold_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        children: const [
          BoldText(text: 'Total Balance', fontSize: 22,)
        ],
      ),
    );
  }
}
