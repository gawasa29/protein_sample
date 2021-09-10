//カードの設定
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';
import 'dart:math' as math;

class MatchCard extends StatefulWidget {
  final String name;
  final String imageURL;
  final int age;
  final String bio;

  MatchCard(@required this.name, @required this.imageURL, @required this.age,
      @required this.bio);

  @override
  _MatchCardState createState() => _MatchCardState();
}

class _MatchCardState extends State<MatchCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
              color: Colors.grey.shade700,
              offset: Offset(0.0, 5.0),
              blurRadius: 20.0)
        ],
        borderRadius: BorderRadius.circular(100.0),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade700,
                    offset: Offset(0.0, 5.0),
                    blurRadius: 15.0)
              ],
              borderRadius: BorderRadius.circular(100.0),
            ),
            height: MediaQuery.of(context).size.height * 0.74,
            width: MediaQuery.of(context).size.width - 10.0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child:
                  Image(fit: BoxFit.cover, image: AssetImage(widget.imageURL)),
            ),
          ),
          Positioned(
            bottom: (40.0),
            left: (40.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      widget.name,
                      style: TextStyle(
                          shadows: [
                            Shadow(
                                color: Colors.black54,
                                offset: Offset(1.0, 2.0),
                                blurRadius: 10.0)
                          ],
                          color: Colors.white,
                          fontSize: (35.0),
                          fontWeight: FontWeight.w800),
                    ),
                    SizedBox(
                      width: (20.0),
                    ),
                    Text(
                      widget.age.toString(),
                      style: TextStyle(
                          shadows: [
                            Shadow(
                                color: Colors.black54,
                                offset: Offset(1.0, 2.0),
                                blurRadius: 10.0)
                          ],
                          color: Colors.white,
                          fontSize: (20.0),
                          fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                SizedBox(
                  height: (10.0),
                ),
                Text(
                  widget.bio,
                  style: TextStyle(
                      color: Colors.white,
                      shadows: [
                        Shadow(
                            color: Colors.black54,
                            offset: Offset(1.0, 2.0),
                            blurRadius: 10.0)
                      ],
                      fontSize: (20.0),
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 1.0,
            right: -1.0,
            child: Container(
              width: MediaQuery.of(context).size.width - 22.0,
              height: MediaQuery.of(context).size.height * 0.15,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  gradient: LinearGradient(
                      colors: [Colors.transparent, Colors.black26],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      stops: [0.0, 1.0])),
            ),
          )
        ],
      ),
    );
  }
}
