import 'package:flutter/material.dart';
import 'package:hack_her/widgets/textfield.dart';
import 'package:hack_her/widgets/button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hack_her/menu.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

//a function that returns the whole widgets of the interface
class _SigninPageState extends State<SigninPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(50),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 80,
          ),
          Text('Sign-In',
              style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[300])),
          SizedBox(height: 70.0),
          TextFieldWidget("Email"),
          SizedBox(height: 20.0),
          TextFieldWidget("Password"),
          SizedBox(height: 5.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text("Forgotten Password ?",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor)
                    ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          InkWell(
            onTap: (){
              Navigator.push(context,MaterialPageRoute(
                        builder: (context) => Menu()));
            },
            child: ButtonBuilder("Sign-In")),
          SizedBox(height: 10.0),
          Container(
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text("Don't have an accout?"),
                  SizedBox(width: 10.0),
                  new GestureDetector(
                    onTap: () {
                      Fluttertoast.showToast(
                        msg: 'Please Sign Up',
                      );
                      
                      //Navigator.push(context,MaterialPageRoute(builder: (context) => SignupPage()));
                    },
                    child: new Text("Sign-Up",
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                        )),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}

