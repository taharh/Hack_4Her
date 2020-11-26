import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:hack_her/calendar.dart';

class MySplashScreen extends StatefulWidget {
  @override
  _MySplashScreenState createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SplashScreen(
        seconds: 5,
        image: Image.asset("images/icon.png"),
        loaderColor: Colors.white,
        photoSize: 70.0,
        gradientBackground: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          stops: [0, 1],
          colors: [
            _getColorFromHex('#FFDCB3'),
            _getColorFromHex('#FF8F8F'),
          ],
        ),
      navigateAfterSeconds: Calendar(),
      ),
    
    );
  }
}

