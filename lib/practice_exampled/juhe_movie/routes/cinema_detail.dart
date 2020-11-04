import 'package:flutter/material.dart';

class CinemaDetail extends StatefulWidget {
  CinemaDetail({Key key}) : super(key: key);

  @override
  _CinemaDetailState createState() => _CinemaDetailState();
}

class _CinemaDetailState extends State<CinemaDetail> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('影院详情， 影院在售影片列表'),
    );
  }
}
