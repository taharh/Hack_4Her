import 'package:flutter/material.dart';

class TextCenter extends StatelessWidget {
  String label;
  Color color;

  TextCenter(this.label, this.color);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
