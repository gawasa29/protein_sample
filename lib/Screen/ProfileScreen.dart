// プロフィール画面

import 'package:flutter/material.dart';

import 'Setting.dart';

class ProfileScreen extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile5.dart";
  @override
  Widget build(BuildContext context) {
    final Color color1 = Colors.grey.shade700;
    final Color color2 = Colors.grey.shade400;
    return Scaffold(
      //appbarを完全に透かすやつ
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        //ちょい透かし
        backgroundColor: Colors.white.withOpacity(0.5),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            color: Colors.black,
            icon: Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(1)),
                  ),
                  builder: (BuildContext context) {
                    return Navigator(
                      onGenerateRoute: (context) => MaterialPageRoute<Setteing>(
                        builder: (context) => Setteing(),
                      ),
                    );
                  });
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Container(
              //スクロールの高さ指定↓
              height: 900,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  CircleAvatar(
                    radius: 150.0,
                    backgroundImage: NetworkImage(
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/a/a9/Mona_Lisa_detail_face.jpg/420px-Mona_Lisa_detail_face.jpg"),
                  ),
                  SizedBox(height: 20.0),
                  Text(
                    "モナリザ",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Icon(
                        Icons.location_on,
                        size: 16.0,
                        color: Colors.grey,
                      ),
                      Text(
                        "イタリア",
                        style: TextStyle(color: Colors.grey.shade600),
                      )
                    ],
                  ),
                  SizedBox(height: 20.0),
                  Divider(
                    height: 20,
                    thickness: 5,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Align(
                      alignment: Alignment(-0.8, 0),
                      child: Text(
                        "プロフィール",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                      )),
                  TextButton(
                    child: const Text('Button'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text('Button'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                  TextButton(
                    child: const Text('Button'),
                    style: TextButton.styleFrom(
                      primary: Colors.black,
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// LimitedBox(
//                     maxHeight: 300, // 高さ指定
//                     child: ListView(
//                       children: <Widget>[
//                         ListTile(
//                           leading: Icon(Icons.map),
//                           title: Text('Map'),
//                         ),
//                         ListTile(
//                           leading: Icon(Icons.photo_album),
//                           title: Text('Album'),
//                         ),
//                         ListTile(
//                           leading: Icon(Icons.phone),
//                           title: Text('Phone'),
//                         ),
//                       ],
//                     ),
//                   ),