// メインのスワイプ画面
import 'package:flutter/material.dart';
import 'package:flutter_tindercard/flutter_tindercard.dart';
import 'package:protein_sample/model/PeopleList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePagestate createState() => _HomePagestate();
}

class _HomePagestate extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late bool _messagesSelected;
  bool _firstVistToFeed = false;
  late TextEditingController _fieldController;
  @override
  void initState() {
    super.initState();
    _messagesSelected = true;
    _fieldController = TextEditingController();
  }

  //なんかアニメーション描くときにいるやつ
  bool chng = true;
  bool atCenter = true;
  bool _triggerNotFound = false;
  bool _timeout = false;
  // わからんけどflutter_tindercardプラグインの何かなのは確か
  @override
  Widget build(BuildContext context) {
    CardController _cardController = CardController();
    return Stack(
      //Widgetを重ねるウィジット
      children: <Widget>[
        AnimatedContainer(
          duration: Duration(milliseconds: 600),
          curve: Curves.fastLinearToSlowEaseIn,
          color: !atCenter
              ? chng
                  ? Colors.pinkAccent.shade200
                  : Colors.tealAccent.shade200
              : Colors.white,
          // child: Center(
          //   child: _triggerNotFound
          //       ? !_timeout
          //           //スワイプ終わりのメッセージ
          //           ? Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: <Widget>[
          //                 CircularProgressIndicator(),
          //                 SizedBox(
          //                   height: 20,
          //                 ),
          //                 Text(
          //                   "Searching nearby matchings ...",
          //                   style: TextStyle(
          //                       fontSize: 30,
          //                       fontWeight: FontWeight.w200,
          //                       color: Colors.grey.shade600),
          //                 )
          //               ],
          //             )
          //           //最後の画像
          //           : Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: <Widget>[
          //                 SizedBox(
          //                   height: 55,
          //                 ),
          //                 ClipRRect(
          //                   borderRadius: BorderRadius.circular(100.0),
          //                   child: Image(
          //                       width: 400,
          //                       height: 400,
          //                       fit: BoxFit.cover,
          //                       image: NetworkImage(
          //                           'https://cdn.dribbble.com/users/25514/avatars/normal/070810be04e642201206c8fbdffcbf8a.png?1455536235')),
          //                 ),
          //                 SizedBox(
          //                   height: (40.0),
          //                 ),
          //                 Padding(
          //                   padding: EdgeInsets.symmetric(horizontal: 40),
          //                   child: Text("ベトナム人しね",
          //                       textAlign: TextAlign.center,
          //                       style: TextStyle(
          //                           wordSpacing: 1.2,
          //                           fontSize: 15,
          //                           fontWeight: FontWeight.w300,
          //                           color: Colors.grey.shade600)),
          //                 )
          //               ],
          //             )
          //       : Container(),
          // ),
        ),
        Container(
          // color: Colors.indigo,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: (40.0),
              ),
              //おすすめいいね
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _messagesSelected = true;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 20.0),
                      child: Text(
                        "おすすめ",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: _messagesSelected
                                ? Theme.of(context).primaryColor
                                : Colors.blueGrey.shade200),
                      ),
                    ),
                  ),
                  VerticalDivider(
                    width: 0,
                    thickness: 2,
                    endIndent: 20.0,
                    indent: 20.0,
                    color: Colors.blueGrey.shade100,
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _messagesSelected = false;
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 50.0, vertical: 20.0),
                      child: Text(
                        "いいね",
                        style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.w500,
                            color: _messagesSelected
                                ? Colors.blueGrey.shade200
                                : Theme.of(context).primaryColor),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
        ////いいね押したときの画面
        _messagesSelected == false
            ? Column(
                children: <Widget>[
                  new SizedBox(
                    height: (100.0),
                  ),
                  new Image(
                      width: (600),
                      height: (400),
                      fit: BoxFit.cover,
                      image: new AssetImage('assets/images/sorry.png')),
                  new SizedBox(
                    height: (50.0),
                  ),
                  new Text(
                    "Check back later",
                    style: new TextStyle(
                        wordSpacing: 1.5,
                        fontSize: (75.0),
                        fontWeight: FontWeight.w400),
                  ),
                  new SizedBox(
                    height: (20.0),
                  ),
                  new Padding(
                    padding: EdgeInsets.symmetric(horizontal: (60.0)),
                    child: new Text(
                        "We couldn't find any social activity for your matches. Try again later",
                        textAlign: TextAlign.center,
                        style: new TextStyle(
                            fontSize: (40.0),
                            fontWeight: FontWeight.w300,
                            color: Colors.grey.shade600)),
                  )
                ],
              )
            : Align(
                //tindercardの設定自由に決める場所
                alignment: Alignment.topCenter,
                child: TinderSwapCard(
                  animDuration: 800,
                  //カードの位置
                  orientation: AmassOrientation.BOTTOM,
                  totalNum: peoples.length,
                  //後ろの数(２までしか無理)
                  stackNum: 2,
                  //スワイプの範囲設定
                  swipeEdge: 10.0,
                  maxWidth: MediaQuery.of(context).size.width - 10.0,
                  maxHeight: MediaQuery.of(context).size.height * 0.74,
                  minWidth: MediaQuery.of(context).size.width - 30.0,
                  minHeight: MediaQuery.of(context).size.height * 0.73,
                  cardBuilder: (context, index) {
                    return peoples[index];
                  },
                  cardController: _cardController,
                  swipeUpdateCallback:
                      (DragUpdateDetails details, Alignment align) {
                    /// Get swiping card's alignment
                    if (align.x < 0) {
                      //Card is LEFT swiping
                      print("Left align " + align.x.toString());
                      setState(() {
                        if (align.x < -1) atCenter = false;
                        chng = true;
                      });
                    } else if (align.x > 0) {
                      //Card is RIGHT swiping
                      print("right align " + align.x.toString());
                      setState(() {
                        if (align.x > 1) atCenter = false;
                        chng = false;
                      });
                    }
                  },
                  swipeCompleteCallback:
                      (CardSwipeOrientation orientation, int index) {
                    /// Get orientation & index of swiped card!
                    setState(() {
                      atCenter = true;
                      if (index == peoples.length - 1) {
                        _triggerNotFound = true;
                        Future.delayed(Duration(seconds: 5), () {
                          _timeout = true;
                          setState(() {});
                        });
                      }
                    });
                  },
                )),
      ],
    );
  }

  double abs(double x) {
    if (x < 0) return x * -1;
    return x;
  }
}

@override
Widget build(BuildContext context) {
  // TODO: implement build
  throw UnimplementedError();
}
