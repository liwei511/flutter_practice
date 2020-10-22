import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class AnimationStaggerExample extends StatefulWidget {
  AnimationStaggerExample({Key key}) : super(key: key);

  @override
  _AnimationStaggerExampleState createState() =>
      _AnimationStaggerExampleState();
}

class _AnimationStaggerExampleState extends State<AnimationStaggerExample>
    with TickerProviderStateMixin {
  AnimationController _controller;
  void initState() {
    super.initState();

    _controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
  }

  Future<Null> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      print('动画取消');
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () => _playAnimation(),
      child: Center(
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
              color: Colors.black.withOpacity(.1),
              border: Border.all(
                color: Colors.black.withOpacity(.5),
              )),
          child: MyStaggerAnimation(
            controller: _controller,
          ),
        ),
      ),
    );
  }
}

class MyStaggerAnimation extends StatelessWidget {
  MyStaggerAnimation({Key key, this.controller}) : super(key: key) {
    height = Tween<double>(begin: .0, end: 300.0).animate(CurvedAnimation(
        parent: controller, curve: Interval(.0, .6, curve: Curves.ease)));

    padding = Tween<EdgeInsets>(
            begin: EdgeInsets.only(left: .0), end: EdgeInsets.only(left: 100.0))
        .animate(CurvedAnimation(
            parent: controller, curve: Interval(.6, 1.0, curve: Curves.ease)));
    // 这里我惯性思维， 写成了 Tween<Color> , 报错 NoSuchMethodError:the method '-' was called on null
    color = ColorTween(begin: Colors.green, end: Colors.red).animate(
        CurvedAnimation(
            parent: controller, curve: Interval(.0, .6, curve: Curves.ease)));
  }

  final AnimationController controller;
  Animation<double> height;
  Animation<EdgeInsets> padding;
  Animation<Color> color;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      builder: (context, child) => Container(
        alignment: Alignment.bottomCenter,
        padding: padding.value,
        child: Container(
          color: color.value,
          width: 50.0,
          height: height.value,
        ),
      ),
      animation: controller,
    );
  }
}
