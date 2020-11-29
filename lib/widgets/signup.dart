import 'package:flutter/material.dart';
import 'package:hack_her/widgets/button.dart';
import 'package:hack_her/widgets/text-center.dart';

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
  String email = "";
  String phone = "";
  String pwd = "";
  String pwd2 = "";
  String emergencyPhone = "";
  String date;

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
                padding: EdgeInsets.fromLTRB(50, 5, 50, 10),
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 40.0),
                    TextCenter("تسجيل حساب", Colors.red[300], 32.0),
                    SizedBox(height: 30.0),
                    TextField(
                      onChanged: (text) {
                        email = text;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "بريد إلكتروني",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        suffixIcon: Icon(Icons.email),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      onChanged: (text) {
                        phone = text;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "رقم الهاتف",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        suffixIcon: Icon(Icons.phone),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      onChanged: (text) {
                        pwd = text;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "كلمة السر",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        suffixIcon: Icon(Icons.lock),
                        prefixIcon: IconButton(
                          onPressed: _toggleVisibility,
                          icon: _isHidden
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                      ),
                      obscureText: _isHidden,
                    ),
                    SizedBox(height: 10.0),
                    TextField(
                      onChanged: (text) {
                        pwd2 = text;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "عاود كلمة السر",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        suffixIcon: Icon(Icons.lock),
                        prefixIcon: IconButton(
                          onPressed: _toggleVisibility,
                          icon: _isHidden
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                      ),
                      obscureText: _isHidden,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) {
                        emergencyPhone = text;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "نومرو إستعجالي",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      onChanged: (text) {
                        date = text;
                      },
                      textAlign: TextAlign.right,
                      decoration: InputDecoration(
                        hintText: "وقتاه مولودة؟",
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 16.0,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.0),
                    InkWell(onTap: () {}, child: ButtonBuilder("سجل")),
                  ],
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
