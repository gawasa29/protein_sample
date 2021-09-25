// プロフィール画面

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protein_sample/Picker/PickerAge.dart';
import 'package:protein_sample/Picker/PickerBody.dart';
import 'package:protein_sample/Picker/PickerFrom.dart';
import 'package:protein_sample/Picker/PickerHeight.dart';

import 'Setting.dart';

class ProfileScreen extends StatelessWidget {
  static final String path = "lib/src/pages/profile/profile5.dart";
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('books').snapshots();
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
                  ElevatedButton(
                    child: const Text('Button'),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => gawasiko()),
                      );
                    },
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

class gawasiko extends StatefulWidget {
  const gawasiko({Key? key}) : super(key: key);

  @override
  _gawasikoState createState() => _gawasikoState();
}

class _gawasikoState extends State<gawasiko> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bookテスト'),
      ),
      body: Center(
        //これがどうやら非同期処理の別の書き方？
        child: FutureBuilder<DocumentSnapshot>(
          future: FirebaseFirestore.instance
              //コレクション名
              .collection('books')
              //ドキュメントID
              .doc('olIIinWDPszl9H9JhIEE')
              .get(),
          builder:
              (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
            // if (snapshot.hasError) {
            //   return Text("Something went wrong");
            // }

            // if (snapshot.hasData && !snapshot.data!.exists) {
            //   return Text("Document does not exist");
            // }

            if (snapshot.connectionState == ConnectionState.done) {
              Map<String, dynamic> data =
                  snapshot.data!.data() as Map<String, dynamic>;
              return Text("Full Name: ${data['マギカ']} ${data['マジが']}");
            }

            return Text("loading");
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: null,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
