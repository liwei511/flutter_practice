import 'package:flutter/material.dart';
import 'index.dart';

class TapboxDemo extends StatefulWidget {
  TapboxState createState() => TapboxState();
}

class TapboxState extends State<TapboxDemo> {
  bool _active = false;
  void _handleTap() {
    setState(() {
      _active = !_active;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(DemoTitle['tapbox_state'])),
        body: GestureDetector(
          onTap: _handleTap,
          child: Container(
            child: Center(
              child: Text(_active ? 'Active' : 'Inactive',
                  style: TextStyle(
                      fontSize: 32,
                      color: _active ? Colors.yellow : Colors.green)),
            ),
            width: 200.0,
            height: 200.0,
            decoration: BoxDecoration(
                color: _active ? Colors.lightGreen[700] : Colors.grey[600]),
          ),
        ));
  }
}
