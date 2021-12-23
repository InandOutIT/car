import 'package:flutter/material.dart';

class CategoryLabel extends StatelessWidget {
  const CategoryLabel({required this.label, required this.cardColor, required this.fontColor});

  final String label;
  final Color cardColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          color: cardColor,
        ),
        height: 50.0,
        width: 100.0,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        child: Center(
          child: Text(
            label,
            style:  TextStyle(color: fontColor),
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
