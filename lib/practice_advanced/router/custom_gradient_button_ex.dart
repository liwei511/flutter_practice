import 'package:flutter/material.dart';
import '../widgets/index.dart';

class CustomGradientButtonExample extends StatelessWidget {
  const CustomGradientButtonExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          GradientButton(
            child: Text('Submit'),
            colors: [Colors.orange, Colors.red],
            height: 50.0,
            decorateType: DecorateType.linear,
          ),
          GradientButton(
            child: Text('Submit'),
            colors: [Colors.lightGreen, Colors.green[700]],
            height: 50.0,
            decorateType: DecorateType.linear,
          ),
          GradientButton(
            child: Text('Submit'),
            colors: [Colors.lightBlue[300], Colors.blueAccent],
            height: 50.0,
            decorateType: DecorateType.linear,
          ),
          GradientButton(
            child: Text('Submit'),
            colors: [Colors.orange, Colors.red],
            width: 100.0,
            height: 100.0,
            decorateType: DecorateType.radial,
          ),
          GradientButton(
            child: Text('Submit'),
            colors: [Colors.lightGreen, Colors.green[700]],
            width: 100.0,
            height: 100.0,
            decorateType: DecorateType.radial,
          ),
          GradientButton(
            child: Text('Submit'),
            colors: [Colors.lightBlue[300], Colors.blueAccent],
            width: 100.0,
            height: 100.0,
            decorateType: DecorateType.radial,
          ),
        ],
      ),
    );
  }
}
