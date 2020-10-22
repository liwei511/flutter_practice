import 'package:flutter/material.dart';

class AnimationStaggerExample extends StatefulWidget {
  AnimationStaggerExample({Key key}) : super(key: key);

  @override
  _AnimationStaggerExampleState createState() =>
      _AnimationStaggerExampleState();
}

class _AnimationStaggerExampleState extends State<AnimationStaggerExample> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('stagger'),
    );
  }
}
