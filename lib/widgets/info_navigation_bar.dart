import 'package:flutter/material.dart';
import 'package:saving_app/widgets/custom_bottom_navigation_bar.dart';

class InfoBottomNavigationBar extends StatelessWidget {
  const InfoBottomNavigationBar({
    super.key,
    required this.onItemTapped,
  });
  final Function(int) onItemTapped;
  @override
  Widget build(BuildContext context) {
    return CustomFixedBottomNavigationBar(
      onItemTapped: onItemTapped,
      unselectedItemColor: Colors.grey[700],
      selectedItemColor: Colors.white,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.business),
          label: 'Business',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.school),
          label: 'School',
        ),
      ],
    );
  }
}
