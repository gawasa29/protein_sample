//チャット前の画面
import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:protein_sample/Screen/ChatScreen.dart';
import 'package:protein_sample/model/ChatUser.dart';
import 'ChatScreen.dart';

class MessagesScreen extends StatefulWidget {
  @override
  _MessagesScreenState createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  late bool _messagesSelected;
  bool _firstVistToFeed = false;
  late TextEditingController _fieldController;

  @override
  void initState() {
    super.initState();
    _messagesSelected = true;
    _fieldController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        _messagesSelected
            ? Expanded(
                child: ListView(
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Column(
                      children: <Widget>[
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            "新しくマッチングした人",
                            style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w600,
                                color: Theme.of(context).secondaryHeaderColor),
                          ),
                        ),
                        SizedBox(
                          height: 30.0,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: 90.0,
                    child: ListView.builder(
                        itemCount: 10,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15.0),
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(90),
                                  color: Colors.blueGrey.shade50),
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  Divider(
                    height: 1,
                    thickness: 2,
                    color: Colors.red,
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "トーク",
                        style: TextStyle(
                            fontSize: (25.0),
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).secondaryHeaderColor),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.0,
                  ),
                  ListBody(
                    children: List.generate(dummyMsg.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ChatScreen()),
                          );
                        },
                        child: Column(
                          children: <Widget>[
                            Container(
                              height: (100.0),
                              margin: EdgeInsets.symmetric(horizontal: (20.0)),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    height: (80),
                                    width: (80),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(100),
                                    ),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(100),
                                      child: Image(
                                          fit: BoxFit.cover,
                                          image: AssetImage(
                                              dummyMsg[index].imageURL)),
                                    ),
                                  ),
                                  SizedBox(
                                    width: (25.0),
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        dummyMsg[index].name,
                                        style: TextStyle(
                                            fontSize: (20.0),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        dummyMsg[index].message,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: (15.0),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ))
                                ],
                              ),
                            ),
                            Divider(
                                height: 1, indent: (300.0), endIndent: (20.0))
                          ],
                        ),
                      );
                    }),
                  )
                ],
              ))
            : _firstVistToFeed == false
                ? Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        CircularProgressIndicator(),
                        SizedBox(
                          height: (30.0),
                        ),
                        Text(
                          "Loading feeds ...",
                          style: TextStyle(
                              fontSize: (50.0),
                              color: Colors.grey.shade600,
                              fontWeight: FontWeight.w300),
                        )
                      ],
                    ),
                  )
                : Expanded(
                    child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: (100.0),
                      ),
                      Image(
                          width: (600),
                          height: (400),
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/sorry.png')),
                      SizedBox(
                        height: (50.0),
                      ),
                      Text(
                        "Check back later",
                        style: TextStyle(
                            wordSpacing: 1.5,
                            fontSize: (75.0),
                            fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: (20.0),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: (60.0)),
                        child: Text(
                            "We couldn't find any social activity for your matches. Try again later",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: (40.0),
                                fontWeight: FontWeight.w300,
                                color: Colors.grey.shade600)),
                      )
                    ],
                  ))
      ],
    );
  }
}
