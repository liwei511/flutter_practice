import 'package:flutter/material.dart';

class EventBusExample extends StatelessWidget {
  const EventBusExample({Key key});
  Widget build(BuildContext context) {
    return Material(
        child: ListView(
      children: [ListTile(title: Text('手势识别'))],
    ));
  }
}
