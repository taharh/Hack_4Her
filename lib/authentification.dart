import 'package:flutter/material.dart';
import 'package:hack_her/widgets/signin.dart';
import 'package:hack_her/widgets/signup.dart';

class Authentification extends StatefulWidget {
  @override
  _AuthentificationState createState() => _AuthentificationState();
}

class _AuthentificationState extends State<Authentification> {

  int _selectedIndex = 0;

  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
                icon: new Icon(
                  
                  Icons.login,
                ),
                title: Text("تسجيل دخول")),
            BottomNavigationBarItem(
                icon: new Icon(
                  Icons.unsubscribe_rounded,
                ),
                title: Text("تسجيل حساب")),
          ],
        ),
        body: Stack(
          children: [
            SizedBox.expand(
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() => _selectedIndex = index);
                },
                children: <Widget>[
                  SigninPage(),
                  SignUpPage(),
                ],
              ),
            ),
          ],
        ),
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      _pageController.animateToPage(index,
          duration: Duration(milliseconds: 1000), curve: Curves.easeOut);
    });
  }

}
