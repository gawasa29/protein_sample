// 電話番号確認画面
import 'package:flutter/material.dart';
import 'package:protein_sample/Screen/CertificationScreen.dart';

class PhoneNumberScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white10,
          automaticallyImplyLeading: false,
          leading: IconButton(
              icon: Icon(Icons.arrow_back_ios_new,
                  color: Theme.of(context).primaryColor),
              onPressed: () {
                Navigator.pop(context);
              }),
        ),
        body: Padding(
            padding: EdgeInsets.only(left: (50.0), right: (50.0)),
            child: Column(children: <Widget>[
              Expanded(
                  flex: 5,
                  child: Column(children: <Widget>[
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "電話番号入力",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                              color: Colors.black54),
                        )),
                    SizedBox(
                      height: (80.0),
                    ),
                    Row(children: <Widget>[
                      Expanded(
                        flex: 2,
                        child: TextField(
                          keyboardType: TextInputType.number,
                          cursorColor: Theme.of(context).primaryColor,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.add,
                                color: Colors.black,
                              ),
                              helperText: '国名コード'),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                          flex: 8,
                          child: TextField(
                            keyboardType: TextInputType.number,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(helperText: '電話番号'),
                          ))
                    ]),
                    SizedBox(
                      height: 40,
                    ),
                    SizedBox(
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
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CertificationScreen()),
                          );
                        },
                        child: const Text('次へ'),
                      ),
                    ),
                  ])),
            ])));
  }
}
