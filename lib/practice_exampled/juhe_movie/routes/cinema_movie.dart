import 'package:flutter/material.dart';

class CinemaMovie extends StatefulWidget {
  CinemaMovie({Key key}) : super(key: key);

  @override
  _CinemaMovieState createState() => _CinemaMovieState();
}

class _CinemaMovieState extends State<CinemaMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('某一个影院，某一个影片 在售列表（影厅）'),
    );
  }
}
