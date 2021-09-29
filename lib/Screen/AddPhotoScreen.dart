// 写真追加画面
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:protein_sample/HomePage.dart';

class AddPhotoScreen extends StatefulWidget {
  const AddPhotoScreen({Key? key}) : super(key: key);

  @override
  _AddPhotoScreenState createState() => _AddPhotoScreenState();
}

class _AddPhotoScreenState extends State<AddPhotoScreen> {
  File? _image;
  final Stream<QuerySnapshot> _usersStream =
      FirebaseFirestore.instance.collection('users').snapshots();

  final doc = FirebaseFirestore.instance.collection('users').doc();
  Future addBook() async {
    String? imgURL;

    if (_image != null) {
      final task = await FirebaseStorage.instance
          .ref('users/${doc.id}')
          .putFile(_image!);
      imgURL = await task.ref.getDownloadURL();
    }
    //firestoreに追加
    SetOptions(merge: true);
    await doc.set({
      'imgURL': imgURL,
    });
  }

  final picker = ImagePicker();
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = File(pickedFile!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('画像を選択')),
        body: Center(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        width: 200,
                        height: 120,
                        child: _image == null
                            ? Container(
                                width: 120,
                                height: 200,
                                color: Colors.grey,
                              )
                            : Image.file(_image!)),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    FloatingActionButton(
                      backgroundColor: Colors.blue,
                      onPressed: getImageFromGallery, //ギャラリーから画像を取得
                      tooltip: 'Pick Image From Gallery',
                      child: Icon(Icons.photo_library),
                    ),
                  ],
                ),
                Center(
                  child: SizedBox(
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
                      onPressed: () {
                        addBook();
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MyHomePage()),
                        );
                      },
                      child: const Text('次へ'),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
