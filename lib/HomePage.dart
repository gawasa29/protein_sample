import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'Screen/MatchingScreen.dart';
import 'Screen/MessagesScreen.dart';
import 'Screen/ProfileScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  int selectedpage = 0; //initial value 
  
  final _pageOptions = [HomePage(), WorkPage(), IdeaPage()]; // listing of all 3 pages index wise
  
  final bgcolor = [Colors.orange, Colors.pink, Colors.greenAccent];  // changing color as per active index value
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[selectedpage], // initial value is 0 so HomePage will be shown 
      bottomNavigationBar: CurvedNavigationBar(
        height: 50, 
        buttonBackgroundColor: Colors.blueAccent,
        backgroundColor: bgcolor[selectedpage],
        color: Colors.white,
        animationCurve: Curves.linearToEaseOut,
        items: <Widget>[
          Icon(
            Icons.home,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.work,
            size: 30,
            color: Colors.black,
          ),
          Icon(
            Icons.wb_incandescent,
            size: 30,
            color: Colors.black,
          )
        ],
        onTap: (index) {
          setState(() {
            selectedpage = index;  // changing selected page as per bar index selected by the user
          });
        },
      ),
    );
  }
}