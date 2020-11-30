import 'package:flutter/material.dart';

class TextCenter extends StatelessWidget {
  String label;
  Color color;
  double size;

  TextCenter(this.label, this.color,this.size);

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
