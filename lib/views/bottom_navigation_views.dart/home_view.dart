import 'package:flutter/material.dart';
import 'package:saving_app/widgets/big_icon_with_text_on_right.dart';
import 'package:saving_app/widgets/bold_text.dart';
import 'package:saving_app/widgets/boxed_custom_card.dart';
import 'package:saving_app/widgets/custom_floating_action_button.dart';
import 'package:saving_app/widgets/list_view_padding.dart';
import 'package:saving_app/widgets/spending_progress.dart';
import 'package:saving_app/widgets/text_padding.dart';
import 'package:saving_app/widgets/transactions_widget.dart';



class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      floatingActionButton: CustomFloatingActionButton(onPressed: (){}),
      body: const ListViewPadding(
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
             BigIconWithTextOnRight(text: '1 USD = 52 Egp', icon: Icon(
              Icons.attach_money, 
              color: Colors.green,
              size: 40,
            ),
            circleText: 'USD',
            ),
          ],
          ),
          TextPadding(
            text: 'Spending breakdown',
          ),
          SpendingProgressWidget(),
          TextPadding(
            text: 'Recent Transactions',
          ),
          TransactionsWidget()
        ],

      ),
    );
  }
}


