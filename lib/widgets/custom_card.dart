
import 'package:flutter/material.dart';

class CustomCard extends StatelessWidget {
  const CustomCard({super.key,   this.backgroundColor, required this.widgets,  this.crossAxisAlignment = CrossAxisAlignment.start, });
  final Color? backgroundColor;
  final CrossAxisAlignment crossAxisAlignment;
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
        
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 26),
        child:  Column(
          crossAxisAlignment: crossAxisAlignment,
          children: widgets,),
        ),
     
    );
  }
}