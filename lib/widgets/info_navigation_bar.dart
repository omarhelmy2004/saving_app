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
    return CustomBottomNavigationBar(
      onItemTapped: onItemTapped,
      unselectedItemColor: Colors.grey[700],
      
      selectedItemColor: Colors.white,
      items: iconsList,
    );
  }

  List<BottomNavigationBarItem> get iconsList {
    return const [
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.home),
        icon: Icon(Icons.home_outlined),
        label: 'Home',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.bar_chart),
        icon: Icon(Icons.bar_chart_outlined),
        label: 'Reports',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.credit_card),
        icon: Icon(Icons.credit_card_outlined),
        label: 'Budget',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.receipt_long),
        icon: Icon(Icons.receipt_long_outlined),
        label: 'Transactions',
      ),
      BottomNavigationBarItem(
        activeIcon: Icon(Icons.checklist),
        icon: Icon(Icons.checklist_outlined),
        label: 'Goals',
      ),
    ];
  }
}
// icon: Icon(Icons.person_outline),
//         label: 'Account',
//will do the account icon at the top of all appbars
