import 'package:flutter/material.dart';

class Seat extends StatefulWidget {
  Seat({Key key}) : super(key: key);

  @override
  _SeatState createState() => _SeatState();
}

class _SeatState extends State<Seat> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('选座，锁座, 票价等'),
    );
  }
}
