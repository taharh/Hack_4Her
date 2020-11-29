import 'package:flutter/material.dart';
import 'package:hack_her/onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hack_her/splashscreen.dart';

int initScreen;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  initScreen = await prefs.getInt("initScreen");
  await prefs.setInt("initScreen", 1);
  print('initScreen ${initScreen}');
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: initScreen == 0 || initScreen == null ? "first" : "Second",
      routes: {
        "Second": (context) => MySplashScreen(),
        "first": (context) => OnBoarding(),
      },
    );
  }

}
