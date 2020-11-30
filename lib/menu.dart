import 'package:flutter/material.dart';
import 'package:hack_her/evidence.dart';
import 'package:hack_her/info.dart';
import 'package:hack_her/widgets/button-arrow.dart';
import 'package:hack_her/chatbot.dart';
import 'package:hack_her/quiz.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class Menu extends StatefulWidget {
  String email;
  Menu(this.email);
  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  bool _load = false;

  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  @override
  void initState() {
    super.initState();
    flutterLocalNotificationsPlugin = new FlutterLocalNotificationsPlugin();

    var android = new AndroidInitializationSettings('@drawable/icon');
    var iOS = new IOSInitializationSettings();
    
    var initSetttings = new InitializationSettings(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) {
    //do nothing
  }

  @override
  Widget build(BuildContext context) {
    showNotification();
    return  WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            )),
            Positioned(
                child: Image.asset(
              "images/header.png",
            )),
            Positioned(
              child: Container(
                padding: EdgeInsets.only(top: 40, right: 10, left: 10),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 2 / 3,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40)),
                    gradient: LinearGradient(
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft,
                        colors: [Colors.red[100], Colors.red[200]])),
                child: Column(
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        alignment: Alignment.centerRight,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white10,
                            ),
                            child: Icon(
                              Icons.notifications,
                              size: 40,
                              color: Colors.white,
                            ))),
                    SizedBox(
                      height: 25,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "عسلامة\n"+widget.email,
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ]),
                  ],
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: MediaQuery.of(context).size.height / 2 - 90,
              child: Container(
                padding: EdgeInsets.all(2),
                width: MediaQuery.of(context).size.width - 20,
                height: MediaQuery.of(context).size.height,
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.red[100],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: MediaQuery.of(context).size.width / 2,
                                  child: Text(
                                    "إخدم الأسئلة بش نجموا نعاونوك",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey[800]),
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => Quiz()));
                                    },
                                    child: ButtonArrow(
                                        "إبدأ الأن", Colors.red[200])),
                              ],
                            ),
                            Image.asset("images/illu2.png", width: 120),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Evidence()));
                          },
                          child: item(context, "images/evidence.png", "دلائل",
                              "إجمعي الدلائل")),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatBot()));
                          },
                          child: item(context, "images/chatbot.png", "أسئلني",
                              "تحب تاخو فكرة عالشكاية و طرقها؟")),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Info()));
                          },
                          child: item(context, "images/group.png", "معلومات",
                              "تحب تاخو نومرو طبيب ولا محامي ؟")),
                      SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  
  }

   Widget item(
      BuildContext context, String img, String title, String description) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.red[100],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            padding: EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.pink[50],
            ),
            child: Icon(Icons.arrow_back_ios),
          ),
          Container(
            width: MediaQuery.of(context).size.width / 3 + 80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title,
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueGrey[800]),
                ),
                Text(
                  description,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.red[200],
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          Image.asset(
            img,
            width: 40,
          ),
        ],
      ),
    );
  }

  showNotification() {
    var android = new AndroidNotificationDetails(
        'channel id', 'channel NAME', 'CHANNEL DESCRIPTION',
        priority: Priority.high,
        importance: Importance.max,
        enableLights: true);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android: android, iOS: iOS);
    flutterLocalNotificationsPlugin.show(
      0,
      'مرحبا بيك',
      'خوذ دقيقة من وقتك بش تجاوب عالأسئلة',
      platform,
    );
  }


}
