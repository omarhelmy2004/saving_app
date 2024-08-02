import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar(
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
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    widget.onItemTapped(index);
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent, // No splash
        highlightColor: Colors.transparent, // No highlight
      ),
      child: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: true,
        enableFeedback: false,
        items: widget.items,
        type: BottomNavigationBarType.shifting,
        backgroundColor: widget.backgroundcolor,
        currentIndex: selectedIndex,
        unselectedItemColor: widget.unselectedItemColor,
        selectedItemColor: widget.selectedItemColor,
        onTap: _onItemTapped,
        iconSize: 30,
      ),
    );
  }
}
