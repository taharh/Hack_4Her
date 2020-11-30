import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:hack_her/authentification.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  int pos = 1;

  switchi() {
    setState(() {
      pos = -pos;
    });
    print(pos.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[50],
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
              top: MediaQuery.of(context).size.height / 4,
              left: 15,
              child: Container(
                width: MediaQuery.of(context).size.width - 30,
                child: pos > 0 ? setCalendar() : setCall(),
              )),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      floatingActionButton: FloatingActionButton(
        elevation: 0,
        backgroundColor: Colors.red[50],
        onPressed: () {
          switchi();
        },
        child: Icon(
          Icons.notification_important,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget setCalendar() {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white, width: 2),
        borderRadius: BorderRadius.circular(25),
        color: Colors.red[100],
      ),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SfCalendar(
          view: CalendarView.month,
          showNavigationArrow: true,
          cellBorderColor: Colors.red[100],
          onTap: (CalendarTapDetails details) async {
            
              final prefs = await SharedPreferences.getInstance();
              final key = 'date';
              final value = prefs.getString(key) ?? 0;
              print('read: $value');
              
            DateTime date = details.date;
            print(date.toString().substring(5, 10));
            if (date.toString().substring(5, 10) == value) {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Authentification()));
            }
          },
        ),
      ),
    );
  }

  Widget setCall() {
    return Center(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white, width: 2),
          borderRadius: BorderRadius.circular(25),
          color: Colors.red[100],
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "تحب تطلب مساعدة ؟",
                    style: TextStyle(
                      fontSize: 28,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1, color: Colors.grey[100]),
                        ),
                        child: InkWell(
                            onTap: () {
                              launch("tel://1899");
                            },
                            child: Icon(Icons.call,
                                size: 40, color: Colors.green))),
                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          border: Border.all(width: 1, color: Colors.grey[100]),
                        ),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                pos = -pos;
                              });
                            },
                            child: Icon(Icons.call_end,
                                size: 40, color: Colors.red))),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
