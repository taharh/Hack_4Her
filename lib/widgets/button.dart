import 'package:flutter/material.dart';

class ButtonBuilder extends StatefulWidget {
  String label;
  ButtonBuilder(this.label);
  @override
  _ButtonBuilderState createState() => _ButtonBuilderState();
}

class _ButtonBuilderState extends State<ButtonBuilder> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 56.0,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(23.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
          end:
              Alignment(0.8, 0.0), // 10% of the width, so there are ten blinds.
          colors: [
            Colors.red[300],
            Colors.red[100],
          ],
          ),
        ),
        child: Center(
          child: Text(widget.label,
              style: TextStyle(color: Colors.white, fontSize: 18.0)),
        ));
  }
}

