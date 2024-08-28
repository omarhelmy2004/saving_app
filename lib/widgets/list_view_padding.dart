import 'package:flutter/material.dart';

class ListViewPadding extends StatelessWidget {
  const ListViewPadding({super.key, required this.children});
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: ListView(
       
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 22),
        children:  children,
      ),
    );
  }
}