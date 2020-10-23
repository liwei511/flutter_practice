import 'package:flutter/material.dart';
import '../widgets/index.dart';

class CustomGradientArcPainterExample extends StatefulWidget {
  CustomGradientArcPainterExample({Key key}) : super(key: key);

  @override
  _CustomGradientArcPainterExampleState createState() =>
      _CustomGradientArcPainterExampleState();
}

class _CustomGradientArcPainterExampleState
    extends State<CustomGradientArcPainterExample> {
  @override
  Widget build(BuildContext context) {
    double _progress = 0.9;
    return GestureDetector(
      onTap: () {
        setState(() {
          _progress += 0.1;
        });
      },
      child: Center(
        child: SizedBox(
          width: 200.0,
          height: 200.0,
          child: CustomPaint(
            painter: GradientArcPainter(
              progress: _progress,
              colors: [Colors.blue, Colors.red],
              width: 8.0,
            ),
            child: Center(
              child: Text('$_progress'),
            ),
          ),
        ),
      ),
    );
  }
}
