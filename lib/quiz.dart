import 'package:flutter/material.dart';
import 'package:hack_her/widgets/button.dart';
import 'package:hack_her/widgets/text-right.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Quiz extends StatefulWidget {
  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int _radioValue = 0;
  int index = 0;

  List<String> questions = [
    "حس بروحك متقلقة كيف تبدى بحذا راجلك؟",
    "تحس روحك تراقب في تصرفاتك باش راجلك ولا حد من عايلتك ما يتغشش؟",
    "راجلك يهين فيك قدام العباد؟",
    "راجلك يعس عليك و يشوفلك في تاليفونك و ما يصدقكش؟",
    "راجلك قطعك على عايلتك و اصحابك؟"
  ];

  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          break;
        case 1:
          break;
        case 2:
          break;
      }
    });
  }

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
                    colors: [Colors.red[300], Colors.red[100]])),
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
                        child:
                            TextRight("سؤال $index من 5", Colors.white60, 12)),
                    Container(
                        padding: EdgeInsets.all(10),
                        width: MediaQuery.of(context).size.width,
                        child: TextRight(questions[index], Colors.white, 20)),
                  ],
                )
              ],
            ),
          ),
          Positioned(
              right: 20,
              top: MediaQuery.of(context).size.height / 3 + 20,
              child: Container(
                width: MediaQuery.of(context).size.width - 50,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          new Text(
                            'لا',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          new Radio(
                            value: 1,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          new Text(
                            'ساعات',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          new Radio(
                            value: 2,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          new Text(
                            'ديما',
                            style: new TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                          new Radio(
                            value: 3,
                            groupValue: _radioValue,
                            onChanged: _handleRadioValueChange,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )),
          Positioned(
            top: MediaQuery.of(context).size.height - 80,
            right: 20,
            child: InkWell(
              onTap: () {
                print(_radioValue);
                if (index >= 4) {
                  Fluttertoast.showToast(
                      msg: " إذا تستحق مساعدة تنجم تتصل بالأطباء الي عنا متطوعين بش يعاونوك",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      textColor: Colors.white,
                      backgroundColor: Colors.red[200],
                      fontSize: 18.0);
                } else {
                  setState(() {
                    index++;
                  });
                }
              },
              child: Container(
                  width: MediaQuery.of(context).size.width - 50,
                  child: ButtonBuilder("الي بعدو")),
            ),
          ),
        ],
      ),
    );
  }
}
