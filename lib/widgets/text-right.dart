import 'package:flutter/material.dart';

class TextRight extends StatelessWidget {
  String label;
  Color color;
  double tsize;

  TextRight(this.label, this.color,this.tsize);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        label,
        textAlign: TextAlign.right,
        style: TextStyle(
          color: color,
          fontSize: tsize,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
