// 写真追加画面
import 'package:flutter/material.dart';

import '../HomePage.dart';
import 'TermsofuseScreen.dart';
class AddPhotoScreen extends StatefulWidget {
  @override
  _AddPhotoScreenState createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white10,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon:
                  Icon(Icons.arrow_back, color: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Padding(
            padding: EdgeInsets.only(left: (50.0), right: (50.0)),
            child: Column(children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Column(children: <Widget>[
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "写真を追加",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        )),
                  Image(
  image: NetworkImage('https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Mona_Lisa_detail_face.jpg/1024px-Mona_Lisa_detail_face.jpg'),
),
                  SizedBox(
                      height: 100,
                    ),
                    SizedBox(
                      height: 50,
                      width: 300,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                          primary: Color.fromRGBO(128, 128, 128, 1.0),
                          onPrimary: Colors.white,
                        ),
                        onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>MyHomePage()),
                          );},
                        child: const Text('次へ'),
                      ),
                    ),
                  ])),
            ])));
  }
}