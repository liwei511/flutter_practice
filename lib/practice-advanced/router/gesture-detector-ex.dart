import 'package:flutter/material.dart';

class GestureDetectorExample extends StatelessWidget {
  const GestureDetectorExample({Key key});
  Widget build(BuildContext context) {
    return Material(
        child: ListView(
      children: [ListTile(title: Text('手势识别'))],
    ));
  }
}
