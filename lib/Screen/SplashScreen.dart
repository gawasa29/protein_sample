import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screenutil.dart';

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
    Timer(Duration(seconds: 2), () {
      //↓画面遷移のコード↓
      Navigator.pop(context);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // ↓screenutilプラグイン使うときにいるやつ↓
    ScreenUtil.init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image(
          image: NetworkImage(
              'https://www.anicom-sompo.co.jp/special/name_dog/dog_2020/img/1-2-1.png'),
        ),
      ),
    );
  }
}
