import 'package:flutter/material.dart';
import 'index.dart';

// 混合状态管理
class TapboxDemo extends StatefulWidget {
  TapboxState createState() => TapboxState();
}

class TapboxState extends State<TapboxDemo> {
  bool _active = false;
  void _handleTap(bool newValue) {
    setState(() {
      _active = newValue;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(DemoTitle['tapbox_state'])),
        body: Column(
          children: <Widget>[
            TapboxChild(
              active: _active,
              handleTap: _handleTap,
            ),
            Text('父Widget管理子Widget的状态')
          ]
        )
      );
  }
}

class TapboxChild extends StatefulWidget {
  TapboxChild({Key key, this.active: false, @required this.handleTap}) : super(key: key);

  final bool active;
  final ValueChanged<bool> handleTap;
  TapboxChildState createState() => TapboxChildState();
}
class TapboxChildState extends State<TapboxChild> {

  Widget build(BuildContext context) {

    void _handleTap() {
      widget.handleTap(!widget.active);
    }
    return GestureDetector(
          onTap: _handleTap,
          child: Container(
            child: Center(
              child: Text(widget.active ? 'Active' : 'Inactive',
                  style: TextStyle(
                      fontSize: 32,
                      color: widget.active ? Colors.yellow : Colors.green)),
            ),
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
                color: widget.active ? Colors.lightGreen[700] : Colors.grey[600]),
          ),
        );
  }
}