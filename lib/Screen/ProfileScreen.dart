// プロフィール画面

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protein_sample/Picker/PickerAge.dart';
import 'package:protein_sample/Picker/PickerBody.dart';
import 'package:protein_sample/Picker/PickerFrom.dart';
import 'package:protein_sample/Picker/PickerHeight.dart';
import 'package:protein_sample/Screen/NameScreen.dart';

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
              //下から出てくるやつ
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
              //スクロールの高さ指定
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 100,
                  ),
                  FutureBuilder<DocumentSnapshot>(
                    //プロフィール名前欄
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(users_id)
                        .get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      Map<String, dynamic> data =
                          snapshot.data?.data() as Map<String, dynamic>;
                      //ヌルの場合サークルがクルクル回る
                      if (data == null) {
                        return CircularProgressIndicator();
                      }
                      return Image.network(data['imgURL']);
                    },
                  ),
                  SizedBox(height: 20.0),
                  FutureBuilder<DocumentSnapshot>(
                    //プロフィール名前欄
                    future: FirebaseFirestore.instance
                        .collection('users')
                        .doc(users_id)
                        .get(),
                    builder: (BuildContext context,
                        AsyncSnapshot<DocumentSnapshot> snapshot) {
                      Map<String, dynamic> data =
                          snapshot.data?.data() as Map<String, dynamic>;
                      //ヌルの場合サークルがクルクル回る
                      if (data == null) {
                        return CircularProgressIndicator();
                      }
                      return Text(data['名前']);
                    },
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
                    thickness: 0.5,
                    indent: 1,
                    endIndent: 1,
                  ),
                  Align(
                      alignment: Alignment(-0.8, 0),
                      child: Text(
                        "プロフィール",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54),
                      )),
                  introAge(),
                  Divider(
                    height: 0.1,
                    thickness: 0.5,
                    indent: 1,
                    endIndent: 1,
                  ),
                  introBody(),
                  Divider(
                    height: 0.1,
                    thickness: 0.5,
                    indent: 1,
                    endIndent: 1,
                  ),
                  introFrom(),
                  Divider(
                    height: 0.1,
                    thickness: 0.5,
                    indent: 1,
                    endIndent: 1,
                  ),
                  introHeight(),
                  Divider(
                    height: 0.1,
                    thickness: 0.5,
                    indent: 1,
                    endIndent: 1,
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
