import 'package:flutter/material.dart';

class PointerEventExample extends StatelessWidget {
  const PointerEventExample({Key key}) : super(key: key);
  Widget build(BuildContext context) {
    return ListView(
      children: [ListTile(title: Text('事件'))],
    );
  }
}
