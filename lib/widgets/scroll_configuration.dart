import 'package:flutter/material.dart';

class CustomScrollConfiguration extends StatelessWidget {
  const CustomScrollConfiguration({super.key, required this.child});
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return  ScrollConfiguration(
      behavior: const ScrollBehavior().copyWith(overscroll: false),
      child: child,
    );
  }
}