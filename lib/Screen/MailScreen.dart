// メールアドレス登録画面
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'TermsofuseScreen.dart';

// 入力されたメールアドレス
String newUserEmail = "";
// 入力されたパスワード
String newUserPassword = "";
// 登録・ログインに関する情報を表示
String infoText = "";

class MailScreen extends StatefulWidget {
  const MailScreen({Key? key}) : super(key: key);

  @override
  _MailScreenState createState() => _MailScreenState();
}

class _MailScreenState extends State<MailScreen> {
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
                          "メールアドレス登録",
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
                        flex: 3,
                        child: TextFormField(
                          // テキスト入力のラベルを設定
                          decoration: InputDecoration(labelText: "メールアドレス"),
                          onChanged: (String value) {
                            setState(() {
                              newUserEmail = value;
                            });
                          },
                        ),
                      ),
                    ]),
                    Row(children: <Widget>[
                      Expanded(
                        flex: 3,
                        child: TextFormField(
                          decoration:
                              InputDecoration(labelText: "パスワード（６文字以上）"),
                          // パスワードが見えないようにする
                          obscureText: true,
                          onChanged: (String value) {
                            setState(() {
                              newUserPassword = value;
                            });
                          },
                        ),
                      ),
                    ]),
                    SizedBox(
                      height: 66,
                    ),
                    // 登録失敗時のエラーメッセージ
                    Padding(
                      padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
                      child: Text(
                        infoText,
                        style: TextStyle(color: Colors.red),
                      ),
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
                        onPressed: () async {
                          try {
                            // メール/パスワードでユーザー登録
                            final FirebaseAuth auth = FirebaseAuth.instance;
                            final UserCredential result =
                                await auth.createUserWithEmailAndPassword(
                              email: newUserEmail,
                              password: newUserPassword,
                            );
                            //メール確認コード
                            await FirebaseAuth.instance.currentUser!
                                .sendEmailVerification();
                            // 登録したユーザー情報
                            final User user = result.user!;
                            print(user);
                            setState(() {
                              infoText = "登録OK：${user.email}";
                            });
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EmailCheckScreen()),
                            );
                          } catch (e) {
                            // 登録に失敗した場合
                            setState(() {
                              infoText = "失敗しました";
                            });
                          }
                        },
                        child: const Text('次へ'),
                      ),
                    ),
                  ])),
            ])));
  }
}

//メール確認画面
class EmailCheckScreen extends StatefulWidget {
  const EmailCheckScreen({Key? key}) : super(key: key);
  @override
  _EmailCheckScreenState createState() => _EmailCheckScreenState();
}

class _EmailCheckScreenState extends State<EmailCheckScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  String _infoText = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("メールアドレスの確認"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: const Text('確認しました'),
              style: ElevatedButton.styleFrom(
                primary: Colors.orange,
                onPrimary: Colors.white,
              ),
              onPressed: () async {
                try {
                  UserCredential userCredential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: newUserEmail,
                    password: newUserPassword,
                  );
                  //中身確認
                  print(userCredential.user?.emailVerified);
                  if (userCredential.user!.emailVerified) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => TermsofuseScreen(),
                        ));
                  } else {
                    setState(() {
                      _infoText = "確認が終わっていません";
                    });
                  }
                } catch (e) {
                  print('NG');
                }
              },
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.0, 0, 20.0, 5.0),
              child: Text(
                _infoText,
                style: TextStyle(color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
