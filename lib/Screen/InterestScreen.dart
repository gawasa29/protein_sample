// 興味のある部位
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'AddPhotoScreen.dart';
import 'TermsofuseScreen.dart';

class InterestScreen extends StatelessWidget {
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
                          "興味のある部位",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        )),
                    SizedBox(
                      height: 600,
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
                                builder: (context) => AddPhotoScreen()),
                          );
                        },
                        child: const Text('次へ'),
                      ),
                    ),
                  ])),
            ])));
  }
}
