import 'package:flutter/material.dart';
import 'package:hack_her/widgets/button.dart';
import 'package:hack_her/widgets/textfield.dart';

void main() => runApp(SignupPage());

class SignupPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SignUpPage(),
    );
  }
}

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool _isHidden = true;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child:
          //////////////////////////////////////////////
          new SingleChildScrollView(
        child: new Column(
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new Container(
                padding: EdgeInsets.all(50),
                child: Center(
                  child: new Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 80.0),
                      Text('Sign-Up',
                          style: TextStyle(
                              fontSize: 32.0,
                              fontWeight: FontWeight.bold,
                              color: _getColorFromHex("#FF8F8F"),)),
                      SizedBox(height: 70.0),
                      TextFieldWidget("Email"),
                      SizedBox(height: 20.0),
                      TextFieldWidget("Password"),
                      SizedBox(height: 20.0),
                      TextFieldWidget("Confirm Password"),
                      SizedBox(height: 50.0),
                      ButtonBuilder("Sign-Up"),
                    ],
                  ),
                )),
          ],
        ),
      ),

      //////////////////////////////////////////////
    );
  }

  Widget buildText(String s) {
    return Text(
      s,
      style: TextStyle(
          fontSize: 40.0, fontWeight: FontWeight.bold, fontFamily: "Pacifico"),
    );
  }
}

Color _getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
}