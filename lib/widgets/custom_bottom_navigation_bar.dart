import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
      {super.key, required this.items, this.selectedItemColor});
  final List<BottomNavigationBarItem> items;
  final Color? selectedItemColor;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: widget.items,
      currentIndex: selectedIndex,
      selectedItemColor: widget.selectedItemColor,
      onTap: onItemTapped,
    );
  }
}
