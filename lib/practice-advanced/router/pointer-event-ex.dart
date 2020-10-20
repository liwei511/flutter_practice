import 'package:flutter/material.dart';

class PointerEventExample extends StatefulWidget {
  PointerEventExampleState createState() => PointerEventExampleState();
}

class PointerEventExampleState extends State {
  PointerEvent _event;
  String position = '';
  Widget build(BuildContext context) {
    return Column(
      children: [
        Listener(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            height: 150.0, // width 默认100%
            child: Text(
              _event?.toString() ?? '',
              style: TextStyle(color: Colors.white),
            ),
          ),
          onPointerDown: (PointerDownEvent event) =>
              setState(() => _event = event),
          onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
          onPointerMove: (PointerMoveEvent event) =>
              setState(() => _event = event),
        ),
        Text('AbsorbPointer本身会参与命中，子树不行' + position),
        Listener(
          child: Container(
            alignment: Alignment.center,
            color: Colors.amber,
            height: 150.0,
            child: AbsorbPointer(
              child: Listener(
                child: Container(
                  color: Colors.red,
                  width: 200.0,
                  height: 100.0,
                ),
                onPointerDown: (event) => setState(() => position = 'in'),
              ),
            ),
          ),
          onPointerDown: (event) => setState(() => position = 'up'),
        )
      ],
    );
  }
}
