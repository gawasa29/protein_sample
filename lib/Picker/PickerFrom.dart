import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:protein_sample/model/picker_list.dart';

class introFrom extends StatefulWidget {
  late String initialValue;
  @override
  introduce createState() => introduce(initial: 'null');
}

class introduce extends State<introFrom> {
  String m_inputValue = "";

  var selectedIndex = 0;
  String initial;
  introduce({required this.initial});

  @override
  Widget build(BuildContext context) {
    return _introFrom();
  }

  String _selectedFrom = "住居地";
  String _initialFrom = "選択";
  Widget _pickerFrom(String str) {
    return Text(
      str,
      style: const TextStyle(fontSize: 32),
    );
  }

  Widget _introFrom() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          padding: EdgeInsets.only(left: 31),
          child: Text("住居地"),
        ),
        Container(
            child: CupertinoButton(
          child: Text("$_initialFrom"),
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
                                _initialFrom = _selectedFrom;
                              });
                            },
                          ),
                        ],
                      ),
                      Container(
                        height: MediaQuery.of(context).size.height / 3,
                        child: CupertinoPicker(
                          itemExtent: 40,
                          children: fromList.map(_pickerFrom).toList(),
                          onSelectedItemChanged: _onSelectedItemChanged_from,
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

  void _onSelectedItemChanged_from(int index) {
    setState(() {
      _selectedFrom = fromList[index];
    });
  }
}
