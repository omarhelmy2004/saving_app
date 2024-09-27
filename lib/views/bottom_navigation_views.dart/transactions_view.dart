import 'package:flutter/material.dart';
import 'package:saving_app/widgets/list_view_padding.dart';
import 'package:saving_app/widgets/toggle_switch.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ListViewPadding(children: [
        CustomToggleSwitch()
      ]),
    );
  }
}