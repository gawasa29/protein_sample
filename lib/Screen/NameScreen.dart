// 名前を入力画面
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:toggle_switch/toggle_switch.dart';

import 'InterestScreen.dart';

//メールアドレスのuidを変数に代入
String users_id = FirebaseAuth.instance.currentUser!.uid;

class NameScreen extends StatefulWidget {
  @override
  _NameScreenState createState() => _NameScreenState();
}

class _NameScreenState extends State<NameScreen> {
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();
  List<bool> _selections = List.generate(3, (_) => false);
  //入力された名前
  String name = "";
  //入力された誕生日
  String birthday = "";
  //性別識別番号
  int genders = 1000;

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
                          decoration: InputDecoration(
                            hintText: '名前',
                          ),
                          onChanged: (String value) {
                            setState(() {
                              name = value;
                            });
                          },
                        ),
                      ),
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
                          decoration: InputDecoration(
                            hintText: '誕生日',
                          ),
                          onChanged: (String value) {
                            setState(() {
                              birthday = value;
                            });
                          },
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 66,
                    ),
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
                        if (index == 0) {
                          print("男です");
                        } else if (index == 1) {
                          print("女です");
                        } else if (index == 2) {
                          print("おかまちゃん");
                        } else {
                          print("お前誰やねん");
                        }
                        genders = index;
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
                    ElevatedButton(
                      child: const Text('送信'),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.orange,
                        onPrimary: Colors.white,
                      ),
                      onPressed: () async {
                        //cloud_firestoreに追加のコード
                        Map<String, dynamic> data = <String, dynamic>{
                          '名前': name,
                          '誕生日': birthday,
                          '性別': genders,
                        };
                        await FirebaseFirestore.instance
                            .collection("users")
                            .doc(users_id)
                            .set(data);
                      },
                    ),
                  ])),
            ])));
  }
}
