import 'package:flutter/material.dart';
import 'package:hack_her/widgets/button.dart';
import 'package:hack_her/widgets/text-center.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

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
  String phone = "";
  String pwd = "";
  String pwd2 = "";
  String emergencyPhone = "";
  String date;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

  void _register() async {
    print("xxxxxxxxxxxxxxx");
    final FirebaseUser user = (await
    _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: pwd,
    )
    ).user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      setState(() {
        _success = true;
      });
    }
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
                child: new Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(height: 80.0),
                    TextCenter("تسجيل حساب", Colors.red[300], 32.0),
                    SizedBox(height: 30.0),
                    TextFormField(
                      controller: _emailController,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),
                    /*TextField(
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
                    ),*/
                    SizedBox(height: 20.0),
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
                    /*TextFormField(
                      controller: _passwordController,
                      decoration: const InputDecoration(labelText:
                      'Password'),
                      validator: (String value) {
                        if (value.isEmpty) {
                          return 'Please enter some text';
                        }
                        return null;
                      },
                    ),*/
                    SizedBox(height: 20.0),
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
                      height: 20,
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
                      height: 20,
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
                    SizedBox(height: 20.0),
                    InkWell(
                      onTap: () async {
                        _register();
                        
                      },
                      child: ButtonBuilder("سجل")),
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


