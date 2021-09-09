// チャット前の人選ぶところ画面
import 'package:flutter/material.dart';

class WorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: Center(
        child: Container(
          child: Text(
            "THIS IS WORK PAGE",
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