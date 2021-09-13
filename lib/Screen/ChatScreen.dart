import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Theme.of(context).canvasColor,
        elevation: .6,
        // automaticallyImplyLeading: false,
        title: Text(
          '師匠',
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 32,
          ),
          child: Column(
            children: <Widget>[
              Expanded(
                child: Column(
                  children: <Widget>[
                    rightBallon(),
                    leftBallon(),
                    leftBallon(),
                    rightBallon(),
                    leftBallon(),
                  ],
                ),
              ),
              textInputWidget(),
            ],
          ),
        ),
      ),
    );
  }

  Padding leftBallon() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28),
      child: Row(
        children: <Widget>[
          CircleAvatar(),
          SizedBox(
            width: 15.0,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color.fromARGB(255, 233, 233, 233),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text('おはようさん！'),
            ),
          )
        ],
      ),
    );
  }

  Padding rightBallon() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 28.0),
      child: Align(
        alignment: Alignment.centerRight,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(40),
              topLeft: Radius.circular(40),
              bottomLeft: Radius.circular(40),
            ),
            gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                colors: [
                  Color.fromARGB(255, 108, 132, 235),
                  Color.fromARGB(250, 132, 199, 250),
                ],
                stops: [
                  0.0,
                  1.0,
                ]),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              'おはようございます！',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Container textInputWidget() {
    return Container(
      height: 70,
      child: Row(
        children: [
          IconButton(
            icon: Icon(Icons.camera_alt_outlined),
            iconSize: 30,
            color: Colors.black54,
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.photo_outlined),
            iconSize: 30,
            color: Colors.black54,
            onPressed: () {},
          ),
          Expanded(
              child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(40),
            ),
            child: TextField(
              autofocus: true,
              decoration: InputDecoration(border: InputBorder.none),
            ),
          )),
          IconButton(
            icon: Icon(Icons.mic),
            iconSize: 30,
            color: Colors.black54,
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
