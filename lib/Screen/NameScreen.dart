// 名前を入力画面
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'InterestScreen.dart';
import 'TermsofuseScreen.dart';

class NameScreen extends StatefulWidget {
  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  List<bool> _selections = List.generate(3, (_) => false);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white10,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,
                  color: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Padding(
            padding: EdgeInsets.only(left: (50.0), right: (50.0)),
            child: Column(children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Column(children: <Widget>[
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "名前",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        )),
                    SizedBox(
                      height: (80.0),
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          flex: 3,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: Theme.of(context).primaryColor,
                          )),
                    ]),
                    SizedBox(
                      height: 66,
                    ),
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "誕生日を入力",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        )),
                    SizedBox(
                      height: (80.0),
                    ),
                    Row(children: <Widget>[
                      Expanded(
                          flex: 3,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: Theme.of(context).primaryColor,
                          )),
                    ]),
                    SizedBox(
                      height: 66,
                    ),
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(20),
                        child: ToggleButtons(
                          children: <Widget>[
                            Icon(Icons.male_outlined, size: 50),
                            Icon(Icons.female_outlined, size: 50),
                            Icon(Icons.transgender_outlined, size: 50),
                          ],
                          // renderBorder: false, //アイコンを囲む枠を消す
                          borderColor: Theme.of(context).accentColor,
                          selectedBorderColor: Theme.of(context).accentColor,
                          borderWidth: 30,
                          borderRadius: BorderRadius.circular(10),
                          isSelected: _selections,
                          onPressed: (int index) {
                            setState(() {
                              for (int buttonIndex = 0;
                                  buttonIndex < _selections.length;
                                  buttonIndex++) {
                                if (buttonIndex == index) {
                                  _selections[buttonIndex] =
                                      !_selections[buttonIndex];
                                } else {
                                  _selections[buttonIndex] = false;
                                }
                              }
                            });
                          },
                        )),
                    SizedBox(
                      height: 66,
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          primary: Color.fromRGBO(128, 128, 128, 1.0),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => InterestScreen()),
                          );
                        },
                        child: const Text('次へ'),
                      ),
                    ),
                  ])),
            ])));
  }
}
