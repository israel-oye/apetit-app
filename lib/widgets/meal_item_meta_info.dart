import 'package:flutter/material.dart';

class MealItemMetaInfo extends StatelessWidget {
  final IconData icon;
  final String label;
  final double width;

  const MealItemMetaInfo({
    super.key,
    required this.label,
    required this.icon,
    this.width = 6,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        SizedBox(width: width,),
        Text(
          label,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}