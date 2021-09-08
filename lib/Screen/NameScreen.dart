// 名前を入力画面
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'TermsofuseScreen.dart';

class NameScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white10,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
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
                    //toggle_switchプラグインのやつ
                    ToggleSwitch(
                    minWidth: 90.0,
                    minHeight: 70.0,
                    initialLabelIndex: 2,
                    cornerRadius: 20.0,
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.grey,
                    inactiveFgColor: Colors.white,
                    totalSwitches: 3,
                    icons: [
                      FontAwesomeIcons.mars,
                      FontAwesomeIcons.venus,
                      FontAwesomeIcons.transgender
                    ],
                    iconSize: 30.0,
                    borderWidth: 2.0,
                    borderColor: [Colors.blueGrey],
                    activeBgColors: [
                      [Colors.blue],
                      [Colors.pink],
                      [Colors.purple]
                    ],
                    onToggle: (index) {
                      print('switched to: $index');
                    },
                  ),
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
                        onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>TermsofuseScreen()),
                          );},
                        child: const Text('次へ'),
                      ),
                    ),
                  ])),
            ])));
  }

  void setState(Null Function() param0) {}
}