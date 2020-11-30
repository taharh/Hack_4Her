import 'package:flutter/material.dart';
import 'package:hack_her/person.dart';
// ignore: must_be_immutable
class Lista extends StatelessWidget {
  String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          )),
          Positioned(
            child: Container(
              padding: EdgeInsets.only(top: 40, right: 10, left: 10),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      colors: [Colors.red[100], Colors.red[50]])),
              child: Column(
                children: [
                  Container(
                      padding: EdgeInsets.all(10),
                      alignment: Alignment.centerRight,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: (){
                              Navigator.of(context).pop();
                            },
                            child: Container(
                                padding: EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white10,
                                ),
                                child: Icon(
                                  Icons.arrow_back,
                                  size: 40,
                                  color: Colors.white,
                                )),
                          ),
                          Container(
                              padding: EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white10,
                              ),
                              child: Icon(
                                Icons.notifications,
                                size: 40,
                                color: Colors.white,
                              )),
                        ],
                      )),
                  SizedBox(
                    height: 25,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      "أختار الطبيب الي حاجتك بيه",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).size.height / 2 - 90,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.white24,
              ),
              padding: EdgeInsets.all(30),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Person()));
                      },
                      child: item(
                        context,
                        "images/doctor.png",
                        "1 طبيب",
                        "أمراض النساء",
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    item(
                      context,
                      "images/doctor.png",
                      "طبيب 2",
                      " الطبيب النفسي ",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    item(
                      context,
                      "images/doctor.png",
                      " 3 طبيب",
                      "طبيب عقلي  ",
                    ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget item(
      BuildContext context, String img, String title, String description) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 1,
              blurRadius: 1,
              offset: Offset(0, 5),
            )
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
            width: MediaQuery.of(context).size.width / 3 + 50,
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
}
