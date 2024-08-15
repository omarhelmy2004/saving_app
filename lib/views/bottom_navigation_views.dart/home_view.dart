import 'package:flutter/material.dart';
import 'package:saving_app/widgets/bold_text.dart';
import 'package:saving_app/widgets/boxed_custom_card.dart';
import 'package:saving_app/widgets/list_view_padding.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      body: ListViewPadding(
        children: [
          BoldText(text: 'Total Balance', fontSize: 32,),
          SizedBox(
            height: 14,
          ),
          BoldText(text: '\$20,000', fontSize: 40,), //variable for user price amounts
          SizedBox(
            height: 20,
          ),
          BoxedCardCustom(text: 'Real-time Rates', widgets: [
          ],)
        ],

      ),
    );
  }
}




class CurrencyNotificationWidget extends StatelessWidget {
  const CurrencyNotificationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            const Icon(
              Icons.attach_money, // Use the dollar sign or any currency icon
              color: Colors.green,
              size: 40,
            ),
            Positioned(
              top: -5,
              right: -5,
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  color: Colors.redAccent,
                  shape: BoxShape.circle,
                ),
                child: const Text(
                  'USD', // Currency code
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(width: 8), // Space between the icon and text
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1000.00',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            Text(
              'Dollar Balance',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ],
    );
  }
}




