// サインアップの初期画面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: 48.0,
      height: 48.0,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Theme.of(context).accentColor,
                Theme.of(context).secondaryHeaderColor,
                Theme.of(context).primaryColor
              ],
              begin: Alignment.topRight,
              end: Alignment.bottomRight,
              stops: [0.0, 0.35, 1.0])),
    ));
  }
}
