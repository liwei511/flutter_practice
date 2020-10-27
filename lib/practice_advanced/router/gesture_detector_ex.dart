import 'package:flutter/material.dart';

class GestureDetectorExample extends StatefulWidget {
  GestureDetectorExample({Key key}) : super(key: key);

  @override
  _GestureDetectorExampleState createState() => _GestureDetectorExampleState();
}

class _GestureDetectorExampleState extends State<GestureDetectorExample> {
  String _operation = 'No Gesture detected! 点击、双击、长按';

  double _top = 0.0;
  double _left = 0.0;

  double _width = 200.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          child: Container(
            alignment: Alignment.center,
            color: Colors.blue,
            width: 200.0,
            height: 100.0,
            child: Text(_operation),
          ),
          onTap: () => setState(() => _operation = 'Tap'),
          onDoubleTap: () => setState(() => _operation = 'DoubleTap'),
          onLongPress: () => setState(() => _operation = 'LongPress'),
        ),
        Container(
          height: 200.0,
          color: Colors.grey,
          child: Stack(
            children: [
              Positioned(
                top: _top,
                left: _left,
                child: GestureDetector(
                  child: CircleAvatar(
                    child: Text('拖'),
                  ),
                  onPanDown: (DragDownDetails e) {
                    print(e.globalPosition);
                  },
                  onPanUpdate: (DragUpdateDetails e) {
                    setState(() {
                      _top += e.delta.dy;
                      _left += e.delta.dx;
                    });
                  },
                  onPanEnd: (DragEndDetails e) {
                    print('滑动结束${e.velocity}');
                  },
                  // 如果单一方向拖动， 使用onVerticalDragUpdate
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          child: Image.asset('assets/images/sliverappbar.jpg', width: _width),
          onScaleUpdate: (ScaleUpdateDetails e) {
            setState(() {
              _width = 200 * e.scale.clamp(.8, 10.0);
            });
          },
        )
      ],
    );
  }
}
// class GestureDetectorExample extends StatelessWidget {
//   const GestureDetectorExample({Key key});
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         GestureDetector(
//           child: Container(
//             alignment: Alignment.center,
//             color: Colors.blue,
//             width: 200.0,
//             height: 100.0,
//             child: Text(),
//           ),
//         )
//       ],
//     );
//   }
// }
