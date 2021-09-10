// メインのスワイプ画面
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePagestate createState() => _HomePagestate();
}

class _HomePagestate extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Text(
            "マッチング画面",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
