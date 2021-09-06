// サインアップの初期画面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'PhoneScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image(
              width: 300.0,
              height: 300.0,
              image: NetworkImage(
                  'https://cdn.dribbble.com/users/25514/avatars/normal/070810be04e642201206c8fbdffcbf8a.png?1455536235')),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                primary: Color.fromRGBO(128, 128, 128, 1.0),
                onPrimary: Colors.white,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PhoneNumberScreen()),
                );
              },
              child: const Text('登録'),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          SizedBox(
            height: 50,
            width: 300,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                primary: Color.fromRGBO(128, 128, 128, 1.0),
                onPrimary: Colors.white,
              ),
              onPressed: () {},
              child: const Text('ログイン'),
            ),
          ),
        ],
      ),
    ));
  }
}
