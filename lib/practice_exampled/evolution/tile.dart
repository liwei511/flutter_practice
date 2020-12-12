import 'package:flutter/material.dart';

class Tile extends StatefulWidget {
  Tile({Key key, this.number, this.width, this.height, this.color})
      : super(key: key);
  int number;
  double width, height;
  Color color; // 块的颜色

  @override
  _TileState createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('${widget.number}'),
      ),
      width: widget.width,
      height: widget.height,
      decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
    );
  }
}
