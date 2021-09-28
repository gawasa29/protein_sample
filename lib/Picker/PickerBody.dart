import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protein_sample/Screen/NameScreen.dart';
import 'package:protein_sample/model/picker_list.dart';

class introBody extends StatefulWidget {
  late String initialValue;
  @override
  introduce createState() => introduce(initial: 'null');
}

class introduce extends State<introBody> {
  String m_inputValue = "";

  var selectedIndex = 0;
  String initial;
  introduce({required this.initial});

  @override
  Widget build(BuildContext context) {
    return _introBody();
  }

  String _selectedBody = "体型";
  String _initialBody = "選択";
  Widget _pickerBody(String str) {
    return Text(
      str,
      style: const TextStyle(fontSize: 32),
    );
  }

  Widget _introBody() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 31),
          child: Text("体型"),
        ),
        Container(
            child: CupertinoButton(
          child: Text("$_initialBody"),
          onPressed: () {
            showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height / 2,
                  child: Column(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          CupertinoButton(
                            child: Text("戻る"),
                            onPressed: () => Navigator.pop(context),
                          ),
                          CupertinoButton(
                            child: Text("決定"),
                            onPressed: () async {
                              _initialBody = _selectedBody;
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(users_id)
                                  .set(
                                {"体型": _initialBody},
                                //既存のコレクション
                                SetOptions(merge: true),
                              );
                              Navigator.pop(context);
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: CupertinoPicker(
                          itemExtent: 40,
                          children: bodyList.map(_pickerBody).toList(),
                          onSelectedItemChanged: _onSelectedItemChanged_body,
                        ),
                      )
                    ],
                  ),
                );
              },
            );
          },
        ))
      ],
    );
  }

  void _onSelectedItemChanged_body(int index) {
    setState(() {
      _selectedBody = bodyList[index];
    });
  }
}
