
import 'package:flutter/material.dart';

class BoxedCardCustom extends StatelessWidget {
  const BoxedCardCustom({super.key, required this.text,  this.backgroundColor, required this.widgets, });
  final Color? backgroundColor;
  final String text;
  final List<Widget> widgets ;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: backgroundColor ?? Theme.of(context).primaryColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side:  BorderSide(color: Theme.of(context).colorScheme.secondary)
      ),
      
      child: Container(
        
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 28),
        child:  Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text, 
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
           Divider(

            height: 30,
          thickness: 1.5,
          indent: 16,
          endIndent: 16,
          color: Theme.of(context).colorScheme.secondary,
          ),
            const SizedBox(height: 10),
            Column(
              children: widgets,
            )
            
          ],
        ),
      ),
    );
  }
}