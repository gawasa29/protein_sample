import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'Screen/SplashScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'マッチョングアプリ',
      theme: ThemeData(
          primaryColor: Color.fromRGBO(128, 128, 128, 1.0),
          secondaryHeaderColor: Color.fromRGBO(128, 128, 128, 1.0),
          colorScheme: ColorScheme.fromSwatch()
              .copyWith(secondary: Color.fromRGBO(250, 250, 250, 1.0))),
      home: SplashScreen(),
    );
  }
}
