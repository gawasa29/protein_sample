import 'package:flutter/material.dart';
import 'Screen/SplashScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tinder Clone',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(128, 128, 128, 1.0),
          secondaryHeaderColor: Color.fromRGBO(128, 128, 128, 1.0),
          accentColor: Color.fromRGBO(198, 198, 198, 1.0)),
      home: SplashScreen(),
    );
  }
}
