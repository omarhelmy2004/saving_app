import 'package:flutter/material.dart';

class CustomFixedBottomNavigationBar extends StatefulWidget {
  const CustomFixedBottomNavigationBar(
      {super.key,
      required this.items,
      this.selectedItemColor,
      this.backgroundcolor,
      this.unselectedItemColor,
      required this.onItemTapped});
  final List<BottomNavigationBarItem> items;
  final Color? unselectedItemColor;
  final Color? selectedItemColor;
  final Color? backgroundcolor;
  final Function(int) onItemTapped;
  @override
  State<CustomFixedBottomNavigationBar> createState() =>
      _CustomFixedBottomNavigationBarState();
}

class _CustomFixedBottomNavigationBarState
    extends State<CustomFixedBottomNavigationBar> {
  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: widget.items,
      type: BottomNavigationBarType.fixed,
      backgroundColor: widget.backgroundcolor,
      currentIndex: selectedIndex,
      unselectedItemColor: widget.unselectedItemColor,
      selectedItemColor: widget.selectedItemColor,
      onTap: _onItemTapped,
    );
  }
}
//Custom Bottom Navigation bar if i need to use it again before changing it