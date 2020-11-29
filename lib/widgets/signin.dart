import 'package:flutter/material.dart';
import 'package:hack_her/widgets/text-center.dart';
import 'package:hack_her/widgets/button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hack_her/menu.dart';

class SigninPage extends StatefulWidget {
  @override
  _SigninPageState createState() => _SigninPageState();
}

//a function that returns the whole widgets of the interface
class _SigninPageState extends State<SigninPage> {
  bool _isHidden = true;
  String phone = "";
  String pwd = "";

  void _toggleVisibility() {
    setState(() {
      _isHidden = !_isHidden;
    });
  }

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
          TextCenter("تسجيل دخول", Colors.red[300], 32.0),
          SizedBox(height: 70.0),
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
          SizedBox(height: 5.0),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                InkWell(
                  onTap: () {
                    Fluttertoast.showToast(
                        msg: "الله غالب",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        textColor: Colors.white,
                        backgroundColor: Colors.red[100],
                        fontSize: 18.0);
                  },
                  child: Text("نسيتها ؟",
                      style: TextStyle(color: Theme.of(context).primaryColor)),
                ),
              ],
            ),
          ),
          SizedBox(height: 40.0),
          InkWell(
              onTap: () {
                if (phone.isEmpty || pwd.isEmpty) {
                  Fluttertoast.showToast(
                        msg: "معطياتك فارغة",
                        toastLength: Toast.LENGTH_SHORT,
                        gravity: ToastGravity.BOTTOM,
                        textColor: Colors.white,
                        backgroundColor: Colors.red[100],
                        fontSize: 18.0);
                } else {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Menu()));
                }
              },
              child: ButtonBuilder("أدخل")),
          SizedBox(height: 10.0),
        ],
      ),
    ));
  }
}
