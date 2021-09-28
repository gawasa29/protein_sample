import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protein_sample/Screen/NameScreen.dart';
import 'package:protein_sample/model/picker_list.dart';

class introAge extends StatefulWidget {
  late String initialValue;
  @override
  introduce createState() => introduce(initial: 'null');
}

class introduce extends State<introAge> {
  String m_inputValue = "";

  var selectedIndex = 0;
  String initial;
  introduce({required this.initial});

  @override
  Widget build(BuildContext context) {
    return _introAge();
  }

  String _selectedAge = "年齢";
  String _initialAge = "選択";
  Widget _pickerAge(String str) {
    return Text(
      str,
      style: const TextStyle(fontSize: 32),
    );
  }

  Widget _introAge() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 31),
          child: Text("年齢"),
        ),
        Container(
            child: CupertinoButton(
          child: Text("$_initialAge"),
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
                              _initialAge = _selectedAge;
                              await FirebaseFirestore.instance
                                  .collection("users")
                                  .doc(users_id)
                                  .set(
                                {"年齢": _initialAge},
                                //既存のドキュメントに追加するために必要なコード
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
                          children: ageList.map(_pickerAge).toList(),
                          onSelectedItemChanged: _onSelectedItemChanged_age,
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

  void _onSelectedItemChanged_age(int index) {
    setState(() {
      _selectedAge = ageList[index];
    });
  }
}
