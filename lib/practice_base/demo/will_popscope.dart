import 'package:flutter/material.dart';

class WillPopScopeDemo extends StatefulWidget {
  WillPopScopeDemo({Key key, this.title}) : super(key: key);
  final String title;
  @override
  WillPopScopeDemoState createState() => WillPopScopeDemoState();
}

class WillPopScopeDemoState extends State<WillPopScopeDemo> {
  DateTime _lastPressedAt; //上次点击时间

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt) > Duration(seconds: 1)) {
            //两次点击间隔超过1秒则重新计时
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        },
        child: Scaffold(
          appBar: AppBar(title: Text(widget.title),),
          body: Center(child: Text("1秒内连续按两次返回键退出"),),
        )
    );
  }
}