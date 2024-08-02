import 'package:flutter/material.dart';
import 'package:saving_app/views/bottom_navigation_views.dart/home_view.dart';

class ViewsListWidget extends StatelessWidget {
  const ViewsListWidget({super.key, required this.selectedIndex});
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return const <Widget>[
      HomeView(),
      Center(child: Text('')),
      Center(child: Text('')),
      Center(child: Text('')),
      Center(child: Text('')),
    ][selectedIndex];
  }
}
