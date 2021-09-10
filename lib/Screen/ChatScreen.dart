// チャット中の画面
import 'package:bubble/bubble.dart';
import 'package:flutter/material.dart';
import 'package:protein_sample/model/ChatUser.dart';
import 'package:protein_sample/model/Message.dart';

class InChatScreen extends StatefulWidget {
  ChatUser user;

  InChatScreen({required this.user});
  @override
  _InChatScreenState createState() => _InChatScreenState();
}

class _InChatScreenState extends State<InChatScreen> {
  late TextEditingController _messageController;
  @override
  void initState() {
    super.initState();
    _messageController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          titleSpacing: 0.0,
          actions: <Widget>[
            ShaderMask(
                child:
                    IconButton(icon: Icon(Icons.more_vert), onPressed: () {}),
                blendMode: BlendMode.srcATop,
                shaderCallback: (Rect bounds) {
                  return LinearGradient(
                      colors: [
                        Theme.of(context).primaryColor,
                        Theme.of(context).accentColor
                      ],
                      begin: Alignment.topRight,
                      end: Alignment.bottomLeft,
                      stops: [0.0, 1.0]).createShader(bounds);
                }),
          ],
          leading: ShaderMask(
              child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
              shaderCallback: (Rect bounds) {
                return LinearGradient(
                    colors: [
                      Theme.of(context).primaryColor,
                      Theme.of(context).accentColor
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    stops: [0.0, 1.0]).createShader(bounds);
              }),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.asset(
                  widget.user.imageURL,
                  fit: BoxFit.cover,
                  height: 80.0,
                  width: 80.0,
                ),
              ),
              SizedBox(width: 20.0),
              Expanded(
                child: Container(
                  padding: EdgeInsets.fromLTRB((10.0), 0.0, 0.0, 0.0),
                  margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                  child: Text(
                    widget.user.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style:
                        TextStyle(fontSize: 70.0, color: Colors.grey.shade600),
                  ),
                ),
              )
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
                flex: 12,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.0,
                    right: 20.0,
                  ),
                  child: ListView.builder(
                    itemCount: msgs.length,
                    reverse: true,
                    itemBuilder: (context, index) {
                      return msgs[index].isMe
                          ? Bubble(
                              margin: BubbleEdges.only(
                                  top: (index < msgs.length - 1 &&
                                          msgs[index + 1].isMe)
                                      ? 5.0
                                      : 20.0,
                                  left: 100.0,
                                  bottom: index == 0 ? 10.0 : 0.0),
                              nip: (index < msgs.length - 2 &&
                                      msgs[index + 1].isMe)
                                  ? BubbleNip.no
                                  : BubbleNip.rightBottom,
                              nipRadius: 11,
                              color: Colors.blue.shade300,
                              style: BubbleStyle(radius: Radius.circular(40.0)),
                              nipHeight: 20,
                              nipWidth: 23,
                              alignment: Alignment.centerRight,
                              elevation: 0.4,
                              child: Text(
                                msgs[index].msg,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 43,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          : Bubble(
                              margin: BubbleEdges.only(
                                  top: (index < msgs.length - 2 &&
                                          msgs[index + 1].isMe)
                                      ? 20.0
                                      : 5.0,
                                  right: 100.0),
                              nip: (index < msgs.length - 2 &&
                                      !msgs[index + 1].isMe)
                                  ? BubbleNip.no
                                  : BubbleNip.leftBottom,
                              color: Colors.blueGrey.shade50,
                              nipHeight: (20),
                              nipWidth: 23,
                              nipRadius: 11,
                              style:
                                  BubbleStyle(radius: Radius.circular((40.0))),
                              alignment: Alignment.centerLeft,
                              elevation: 0.4,
                              child: Text(
                                msgs[index].msg,
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontSize: (43),
                                    fontWeight: FontWeight.w400),
                              ),
                            );
                    },
                  ),
                )),
            Container(
              padding: EdgeInsets.only(bottom: (5.0)),
              height: (100.0),
              decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30.0)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: Container(
                        height: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(0.0, 0.0), color: Colors.grey)
                            ],
                            borderRadius: BorderRadius.circular(50.0)),
                        child: Align(
                          alignment: Alignment.center,
                          child: TextField(
                            controller: _messageController,
                            cursorColor: Theme.of(context).primaryColor,
                            decoration: InputDecoration(
                                hintText: "Type a message",
                                border: InputBorder.none,
                                suffixIcon: Padding(
                                  padding: EdgeInsets.only(right: 20.0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Icon(
                                        Icons.attachment,
                                        color: Colors.grey,
                                      ),
                                      SizedBox(width: 15.0),
                                      Icon(
                                        Icons.camera_alt,
                                        color: Colors.grey,
                                      ),
                                    ],
                                  ),
                                ),
                                prefixIcon: Icon(
                                  Icons.sentiment_satisfied,
                                  size: 70.0,
                                  color: Colors.grey,
                                )),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        flex: 1,
                        child: Container(
                            height: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.blue.shade300,
                                borderRadius: BorderRadius.circular(50.0)),
                            child: Center(
                              child: Icon(
                                Icons.send,
                                size: 70.0,
                                color: Colors.white,
                              ),
                            )))
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
