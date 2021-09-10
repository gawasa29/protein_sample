import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'Screen/MatchingScreen.dart';
import 'Screen/MessagesScreen.dart';
import 'Screen/ProfileScreen.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int selectedpage = 0; //initial value

  final _pageOptions = [
    HomePage(),
    MessagesScreen(),
    ProfileScreen()
  ]; // listing of all 3 pages index wise
// changing color as per active index value

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pageOptions[
          selectedpage], // initial value is 0 so HomePage will be shown
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.white,
        color: Colors.white,
        items: <Widget>[
          Icon(
            Icons.home_outlined,
            size: 33,
          ),
          Icon(
            FontAwesomeIcons.comment,
            size: 25,
          ),
          Icon(
            FontAwesomeIcons.user,
            size: 25,
          )
        ],
        onTap: (index) {
          setState(() {
            selectedpage =
                index; // changing selected page as per bar index selected by the user
          });
        },
      ),
    );
  }
}
