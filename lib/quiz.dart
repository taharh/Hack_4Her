import 'package:flutter/material.dart';
import 'package:hack_her/widgets/button.dart';
import 'package:hack_her/widgets/text-right.dart';

class Quiz extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.only(top: 40, right: 10, left: 10),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [Colors.blue, Colors.red])),
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
                          onTap: () {
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
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: TextRight("سؤال 1 من 10", Colors.white60, 15)),
                    Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: TextRight(
                            "هل تعرضت للعنف من قبل ؟", Colors.white, 20)),
                  ],
                )
              ],
            ),
          ),
          Positioned(
            right: 20,
            top: MediaQuery.of(context).size.height/2,
              child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width-50,
                    height: 60,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white
                  ),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width-50,
                    height: 60,
                  ),
                ),
              ],
            ),
          )),
          Positioned(
            top: MediaQuery.of(context).size.height-80,
            left: 10,
            child: 
            Container(
              width: MediaQuery.of(context).size.width-20,
              child: ButtonBuilder("الي بعدوا")),
          ),
        ],
      ),
    );
  }
}
