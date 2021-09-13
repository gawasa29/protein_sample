// プロフィール画面

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Setting.dart';

class ProfileScreen extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile5.dart";
  @override
  Widget build(BuildContext context) {
    final Color color1 = Colors.grey.shade700;
    final Color color2 = Colors.grey.shade400;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: color1,
        elevation: 0,
        actions: <Widget>[
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.notifications),
            onPressed: () {},
          ),
          IconButton(
            color: Colors.white,
            icon: Icon(Icons.menu),
            onPressed: () {
              showModalBottomSheet(
                  enableDrag: false,
                  isDismissible: true,
                  context: context,
                  isScrollControlled: true, //trueにしないと、Containerのheightが反映されない
                  shape: RoundedRectangleBorder(
                    //丸み設定
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(1)),
                  ),
                  builder: (BuildContext context) {
                    return setteing();
                  });
            },
          ),
        ],
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: 360,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(50.0),
                    bottomRight: Radius.circular(50.0)),
                //背景のグラデーション
                gradient: LinearGradient(
                    colors: [color1, color2],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                Text(
                  "Date mate",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontStyle: FontStyle.italic),
                ),
                SizedBox(height: 20.0),
                Expanded(
                  child: Stack(
                    children: <Widget>[
                      Container(
                          height: double.infinity,
                          margin: const EdgeInsets.only(
                              left: 30.0, right: 30.0, top: 10.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: Image.network(
                                'https://yukawanet.com/wp-content/uploads/2019/02/hageIMGL0399.jpg'),
                          )),
                      Container(
                        alignment: Alignment.topCenter,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 5.0),
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(20.0)),
                          child: Text("3.7mi away"),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Text(
                  "Sasha - 22",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
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
                      "San Diego, California, USA",
                      style: TextStyle(color: Colors.grey.shade600),
                    )
                  ],
                ),
                SizedBox(height: 5.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
