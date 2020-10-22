import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimationFadeRouteExmplate extends StatelessWidget {
  AnimationFadeRouteExmplate({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.all(8.0),
          child: RaisedButton(
            child: Text('MaterialPageRoute'),
            onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PageMaterial(),
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: RaisedButton(
            child: Text('CupertinoPageRoute'),
            onPressed: () => Navigator.push(
                context,
                CupertinoPageRoute(
                  builder: (context) => PageCupertino(),
                )),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(8.0),
          child: RaisedButton(
            child: Text('CupertinoPageRoute'),
            onPressed: () => Navigator.push(
                context,
                FadeRoute(
                  builder: (context) => PageDiv(),
                )),
          ),
        ),
      ],
    );
  }
}

class PageMaterial extends StatelessWidget {
  const PageMaterial({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MaterialPageRoute'),
        ),
        body: Container(
          alignment: Alignment.center,
          height: 200.0,
          width: 100.0,
          color: Colors.blue,
        ));
  }
}

class PageCupertino extends StatelessWidget {
  const PageCupertino({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('CupertinoPageRoute'),
        ),
        body: Container(
          alignment: Alignment.center,
          height: 200.0,
          width: 100.0,
          color: Colors.green,
        ));
  }
}

class PageDiv extends StatelessWidget {
  const PageDiv({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('FadeRoute '),
        ),
        body: Container(
          alignment: Alignment.center,
          height: 200.0,
          width: 100.0,
          color: Colors.red,
        ));
  }
}

class FadeRoute extends PageRoute {
  FadeRoute(
      {@required this.builder,
      this.opaque = true,
      this.barrierColor,
      this.barrierLabel,
      this.barrierDismissible = false,
      this.maintainState = false,
      this.transitionDuration = const Duration(milliseconds: 300)});

  final WidgetBuilder builder;

  final bool opaque; // 不透明
  final Color barrierColor;
  final String barrierLabel;
  final bool barrierDismissible; // 障碍可解雇的？？
  final bool maintainState;
  final Duration transitionDuration;

  Widget buildPage(BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) =>
      builder(context);
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    if (isActive) {
      return FadeTransition(
        opacity: animation,
        child: builder(context),
      );
    } else {
      // 若返回， 则不应用过渡动画
      return Padding(padding: EdgeInsets.zero);
    }
  }
}
