import 'package:flutter/material.dart';

class ViewsListWidget extends StatelessWidget {
  const ViewsListWidget({super.key, required this.selectedIndex});
  final int selectedIndex;
  @override
  Widget build(BuildContext context) {
    return const <Widget>[
      Center(child: Text('Home View')),
      Center(child: Text('Business View')),
      Center(child: Text('School View')),
      Center(child: Text('Explore View')),
      Center(child: Text('Settings View')),
    ][selectedIndex];
  }
}
