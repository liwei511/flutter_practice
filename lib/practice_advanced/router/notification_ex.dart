import 'package:flutter/material.dart';

class NotificationExample extends StatelessWidget {
  const NotificationExample({Key key});
  Widget build(BuildContext context) {
    return Material(
        child: ListView(
      children: [ListTile(title: Text('手势识别'))],
    ));
  }
}
