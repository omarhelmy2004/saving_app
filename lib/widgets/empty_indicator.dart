import 'package:flutter/material.dart';

class EmptyIndicator extends StatelessWidget {
  const EmptyIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(height: 10, indent: 160,thickness: 1, endIndent: 160,color: Colors.grey,);
  }
}