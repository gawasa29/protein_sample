import 'dart:async';

import 'package:flutter/material.dart';

import 'LoginScreen.dart';

//最初一瞬の表示ページ
class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    //↓画像の表示時間の設定↓
    Timer(Duration(seconds: 3), () {
      //↓画面遷移のコード↓
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: Image(
        width: 100.0,
        height: 100.0,
        image: NetworkImage(
            'https://cdn.dribbble.com/users/25514/avatars/normal/070810be04e642201206c8fbdffcbf8a.png?1455536235'
            ),
      )),
    );
  }
}
