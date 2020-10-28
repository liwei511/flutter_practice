import 'package:flutter/material.dart';

class AnimationDecoratedExample extends StatefulWidget {
  AnimationDecoratedExample({Key key}) : super(key: key);

  @override
  _AnimationDecoratedExampleState createState() =>
      _AnimationDecoratedExampleState();
}

class _AnimationDecoratedExampleState extends State<AnimationDecoratedExample> {
  double _padding = 10;
  Alignment _alain = Alignment.topRight;
  double _height = 100.0;
  double _left = .0;

  Color _color = Colors.red;
  TextStyle _style = TextStyle(color: Colors.black);
  Color _decorationColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    Duration duration = Duration(seconds: 2);
    return SingleChildScrollView(
      child: Column(
        children: [
          RaisedButton(
            // 在padding发生变化时会执行过渡动画到新状态
            child: AnimatedPadding(
              child: Text('AnimatiedPadding'),
              duration: duration,
              padding: EdgeInsets.all(_padding),
            ),
            onPressed: () => setState(() {
              _padding = 20;
            }),
          ),
          SizedBox(
            height: 50.0,
            child: Stack(
              children: [
                // 配合Stack一起使用，当定位状态发生变化时会执行过渡动画到新的状态。
                AnimatedPositioned(
                  duration: duration,
                  left: _left,
                  child: RaisedButton(
                    child: Text('AnimatedPositioned'),
                    onPressed: () => setState(() {
                      _left = 100;
                    }),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: 100.0,
            color: Colors.grey,
            child: AnimatedAlign(
              duration: duration,
              alignment: _alain,
              child: RaisedButton(
                child: Text('AnimatedAlign'),
                onPressed: () => setState(() => _alain = Alignment.center),
              ),
            ),
          ),
          AnimatedContainer(
            duration: duration,
            height: _height,
            color: _color,
            child: FlatButton(
              child: Text(
                'AnimatedContainer',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => setState(() {
                _height = 150.0;
                _color = Colors.blue;
              }),
            ),
          ),
          AnimatedDefaultTextStyle(
            duration: duration,
            style: _style,
            child: GestureDetector(
              child: Text('AnimatedDefaultTextStyle'),
              onTap: () {
                setState(() {
                  _style = TextStyle(
                    color: Colors.blue,
                    decorationStyle: TextDecorationStyle.solid,
                    decorationColor: Colors.blue,
                  );
                });
              },
            ),
          ),
          AnimatedDecoratedBox(
            duration: duration,
            decoration: BoxDecoration(color: _decorationColor),
            child: FlatButton(
              child: Text(
                'AnimatedDecoratedBox',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => setState(() => _decorationColor = Colors.red),
            ),
          )
        ]
            .map((e) => Padding(
                  // 这里写的好吧， 一步添加重复包裹
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}

// 自定义过渡动画
class AnimatedDecoratedBox extends ImplicitlyAnimatedWidget {
  AnimatedDecoratedBox(
      {Key key,
      @required this.decoration,
      this.child,
      Curve curve = Curves.linear,
      @required Duration duration})
      : super(curve: curve, duration: duration, key: key);
  final decoration;
  final Widget child;

  AnimatedDecoratedBoxState createState() => AnimatedDecoratedBoxState();
}

class AnimatedDecoratedBoxState
    extends AnimatedWidgetBaseState<AnimatedDecoratedBox> {
  DecorationTween _decorationTween;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: _decorationTween.evaluate(animation),
      child: widget.child,
    );
  }

  @override
  void forEachTween(visitor) {
    // TODO: implement forEachTween
    _decorationTween = visitor(_decorationTween, widget.decoration,
        (value) => DecorationTween(begin: value));
  }
}
