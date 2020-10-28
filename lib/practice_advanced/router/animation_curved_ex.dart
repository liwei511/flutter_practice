import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimationCurvedExample extends StatefulWidget {
  AnimationCurvedExample({Key key}) : super(key: key);

  @override
  _AnimationCurvedExampleState createState() => _AnimationCurvedExampleState();
}

class _AnimationCurvedExampleState extends State<AnimationCurvedExample>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  void initState() {
    super.initState();
    _controller = new AnimationController(
        duration: const Duration(seconds: 2), vsync: this);
    // 图片宽高从0变到300
    final curvedAnimation = CurvedAnimation(
        parent: _controller, curve: Curves.easeIn); // ShskeCurve()
    _animation = new Tween(begin: 0.0, end: 300.0).animate(curvedAnimation)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            RaisedButton(
              child: Text('启动'),
              onPressed: () => _controller.forward(),
            ),
            RaisedButton(
              child: Text('停止'),
              onPressed: () => _controller.stop(),
            ),
            RaisedButton(
              child: Text('反向播放'),
              onPressed: () => _controller.reverse(),
            ),
          ],
        ),
        Center(
          child: Image.asset(
            'assets/images/sliverappbar.jpg',
            width: _animation.value,
            height: _animation.value,
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

// 自定义正弦曲线
class ShskeCurve extends Curve {
  double transform(double t) {
    return math.sin(t * math.pi * 2);
  }
}
