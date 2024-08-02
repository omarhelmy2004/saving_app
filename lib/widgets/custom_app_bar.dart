import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key,
      required this.icon1,
      this.onPressed1,
      required this.icon2,
      this.onPressed2,
      this.text = ''});
  final String text;
  final Widget icon1;
  final void Function()? onPressed1;
  final Widget icon2;
  final void Function()? onPressed2;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 14, left: 4, right: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: onPressed1,
            icon: icon1,
          ),
          Text(
            text,
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          IconButton(
            onPressed: onPressed2,
            icon: icon2,
          )
        ],
      ),
    );
  }
}
