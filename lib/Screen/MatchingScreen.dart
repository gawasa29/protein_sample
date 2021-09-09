// メインのスワイプ画面
import 'package:flutter/material.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange,
      body: Center(
        child: Container(
          child: Text(
            "THIS IS HOME PAGE",
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}