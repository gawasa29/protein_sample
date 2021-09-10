// チャット前の人選ぶところ画面
import 'package:flutter/material.dart';

class WorkPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          child: Text(
            "チャット前の人選ぶところ画面",
            style: TextStyle(
                color: Colors.black54,
                fontSize: 20,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
