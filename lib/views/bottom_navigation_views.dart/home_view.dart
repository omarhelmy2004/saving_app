import 'package:flutter/material.dart';
import 'package:saving_app/widgets/bold_text.dart';
import 'package:saving_app/widgets/list_view_padding.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ListViewPadding(
        children: [
          BoldText(text: 'Total Balance', fontSize: 22,),
          SizedBox(
            height: 16,
          ),
          BoldText(text: '\$20,000', fontSize: 40,),
          SizedBox(
            height: 10,
          ),

        ],

      ),
    );
  }
}
