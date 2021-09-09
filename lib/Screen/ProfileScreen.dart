// プロフィール画面
import 'package:flutter/material.dart';

class IdeaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent,
      body: Center(
        child: Container(
          child: Text(
            "THIS IS IDEA PAGE",
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