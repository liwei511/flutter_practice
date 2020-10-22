import 'package:flutter/material.dart';

// AnimatedSwitch 可以同时对其新、旧元素添加显示、隐藏动画。新元素执行forward， 旧元素执行reverse

class AnimationSwitchExample extends StatefulWidget {
  AnimationSwitchExample({Key key}) : super(key: key);

  @override
  _AnimationSwitchExampleState createState() => _AnimationSwitchExampleState();
}

class _AnimationSwitchExampleState extends State<AnimationSwitchExample> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    Text text = Text(
      '$_count',
      key: ValueKey<int>(_count), // 显式指定key， 不同的key会被认为时不同的text
      style: Theme.of(context).textTheme.headline4,
    );
    Duration duration = Duration(milliseconds: 500);
    return Center(
      child: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, // 横轴三个子 Widget
        ),
        children: [
          AnimatedSwitcher(
            duration: duration,
            transitionBuilder: (child, animation) => RotationTransition(
              child: child,
              turns: animation,
            ),
            child: text,
          ),
          AnimatedSwitcher(
            duration: duration,
            transitionBuilder: (child, animation) => ScaleTransition(
              child: child,
              scale: animation,
            ),
            child: text,
          ),
          AnimatedSwitcher(
            duration: duration,
            transitionBuilder: (child, animation) => FadeTransition(
              child: child,
              opacity: animation,
            ),
            child: text,
          ),
          // AnimatedSwitcher(
          //   duration: duration,
          //   transitionBuilder: (child, animation) => SliverFadeTransition(
          //     sliver: child,
          //     opacity: animation,
          //   ),
          //   child: text,
          // ),
          // 旧页面屏幕中向左侧平移退出，新页面重屏幕右侧平移进入
          AnimatedSwitcher(
            duration: duration,
            transitionBuilder: (child, animation) => SlideTransition(
              child: child,
              position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                  .animate(animation),
            ),
            child: text,
          ),
          AnimatedSwitcher(
            duration: duration,
            transitionBuilder: (child, animation) => MySlideTransition(
              child: child,
              position: Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0))
                  .animate(animation),
            ),
            child: text,
          ),
          AnimatedSwitcher(
            duration: duration,
            transitionBuilder: (child, animation) => SlideTransitionX(
              child: child,
              direction: AxisDirection.down,
              position: animation,
            ),
            child: text,
          ),
          AnimatedSwitcher(
            duration: duration,
            transitionBuilder: (child, animation) => SlideTransitionX(
              child: child,
              direction: AxisDirection.up,
              position: animation,
            ),
            child: text,
          ),
          AnimatedSwitcher(
            duration: duration,
            transitionBuilder: (child, animation) => SlideTransitionX(
              child: child,
              direction: AxisDirection.left,
              position: animation,
            ),
            child: text,
          ),
          AnimatedSwitcher(
            duration: duration,
            transitionBuilder: (child, animation) => SlideTransitionX(
              child: child,
              direction: AxisDirection.right,
              position: animation,
            ),
            child: text,
          ),

          RaisedButton(
            child: Text('+1'),
            onPressed: () => setState(() {
              _count++;
            }),
          )
        ],
      ),
    );
  }
}

// 打破正向反向对称性
class MySlideTransition extends AnimatedWidget {
  MySlideTransition({
    Key key,
    @required Animation<Offset> position,
    this.transformHitTests = true,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position);

  Animation<Offset> get position => listenable;
  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    Offset offset = position.value;
    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}

// 出入滑动效果
class SlideTransitionX extends AnimatedWidget {
  SlideTransitionX({
    Key key,
    @required Animation<double> position,
    this.transformHitTests = true,
    this.direction = AxisDirection.down,
    this.child,
  })  : assert(position != null),
        super(key: key, listenable: position) {
    // 偏移在内部处理
    switch (direction) {
      case AxisDirection.up:
        _tween = Tween(begin: Offset(0, 1), end: Offset(0, 0));
        break;
      case AxisDirection.right:
        _tween = Tween(begin: Offset(-1, 0), end: Offset(0, 0));
        break;
      case AxisDirection.down:
        _tween = Tween(begin: Offset(0, -1), end: Offset(0, 0));
        break;
      case AxisDirection.left:
        _tween = Tween(begin: Offset(1, 0), end: Offset(0, 0));
        break;
    }
  }

  Animation<double> get position => listenable;

  final bool transformHitTests;

  final Widget child;

  //退场（出）方向
  final AxisDirection direction;

  Tween<Offset> _tween;

  @override
  Widget build(BuildContext context) {
    Offset offset = _tween.evaluate(position);
    if (position.status == AnimationStatus.reverse) {
      switch (direction) {
        case AxisDirection.up:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.right:
          offset = Offset(-offset.dx, offset.dy);
          break;
        case AxisDirection.down:
          offset = Offset(offset.dx, -offset.dy);
          break;
        case AxisDirection.left:
          offset = Offset(-offset.dx, offset.dy);
          break;
      }
    }
    return FractionalTranslation(
      translation: offset,
      transformHitTests: transformHitTests,
      child: child,
    );
  }
}
