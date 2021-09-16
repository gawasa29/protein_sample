import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protein_sample/model/picker_list.dart';

class introHeight extends StatefulWidget {
  late String initialValue;
  @override
  introduce createState() => introduce(initial: 'null');
}

class introduce extends State<introHeight> {
  String m_inputValue = "";

  var selectedIndex = 0;
  String initial;
  introduce({required this.initial});

  @override
  Widget build(BuildContext context) {
    return _introHeight();
  }

  String _selectedHeight = "身長";
  String _initialHeight = "選択";
  Widget _pickerHeight(String str) {
    return Text(
      str,
      style: const TextStyle(fontSize: 32),
    );
  }

  Widget _introHeight() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 31),
          child: Text("身長"),
        ),
        Container(
            child: CupertinoButton(
          child: Text("$_initialHeight"),
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
                            onPressed: () {
                              Navigator.pop(context);
                              setState(() {
                                _initialHeight = _selectedHeight;
                              });
                            },
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: CupertinoPicker(
                          itemExtent: 40,
                          children: heightList.map(_pickerHeight).toList(),
                          onSelectedItemChanged: _onSelectedItemChanged_height,
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

  void _onSelectedItemChanged_height(int index) {
    setState(() {
      _selectedHeight = heightList[index];
    });
  }
}
