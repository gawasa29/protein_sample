//設定画面
import 'package:flutter/material.dart';

class setteing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: DraggableScrollableSheet(
            expand: false,
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                  color: Colors.blue,
                  child: ListView.builder(
                      controller: scrollController,
                      itemCount: 11,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(title: Text('Item $index'));
                      }));
            }));
  }
}
