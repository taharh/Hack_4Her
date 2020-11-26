import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  String hintText;
  TextFieldWidget(this.hintText);
  @override
  _TextFieldWidgetState createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 16.0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          prefixIcon:
              widget.hintText == "Email" ? Icon(Icons.email) : Icon(Icons.lock),
          suffixIcon: widget.hintText == "Password" || widget.hintText == "Confirm Password"
              ? IconButton(
                  onPressed: _toggleVisibility,
                  icon: _isHidden
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.visibility),
                )
              : null),
      obscureText: widget.hintText == "Password" || widget.hintText == "Confirm Password" ? _isHidden : false,
    );
  }
}


