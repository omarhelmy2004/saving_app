import 'package:flutter/material.dart';
import 'package:saving_app/widgets/scroll_configuration.dart';

class ListViewPadding extends StatelessWidget {
  const ListViewPadding({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return CustomScrollConfiguration(
      child: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        children:  children,
      ),
    );
  }
}