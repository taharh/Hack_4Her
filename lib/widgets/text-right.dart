import 'package:flutter/material.dart';

class TextRight extends StatelessWidget {
  String label;
  Color color;

  TextRight(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.right,
      style: TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
