// 利用規約画面
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'NameScreen.dart';
import 'PhoneScreen.dart';

class TermsofuseScreen extends StatelessWidget {
  const TermsofuseScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white10,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,
                  color: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image(
                  width: 300.0,
                  height: 300.0,
                  image: NetworkImage(
                      'https://cdn.dribbble.com/users/25514/avatars/normal/070810be04e642201206c8fbdffcbf8a.png?1455536235')),
              Text('〇〇〇〇〇〇〇〇', style: TextStyle(fontSize: 36)),
              Text('〇〇〇〇〇〇〇〇', style: TextStyle(fontSize: 36)),
              Text('〇〇〇〇〇〇〇〇', style: TextStyle(fontSize: 36)),
              Text('〇〇〇〇〇〇〇〇', style: TextStyle(fontSize: 36)),
              SizedBox(
                height: 50,
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
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => NameScreen()),
                    );
                  },
                  child: const Text('同意する'),
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ));
  }
}
