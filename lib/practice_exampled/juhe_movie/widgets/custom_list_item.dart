import 'package:flutter/material.dart';

class CustomListItem extends StatefulWidget {
  CustomListItem(
      {Key key, this.child, this.title, this.subtitle, this.trailing})
      : super(key: key);

  final Widget child; // 横向放几个最近的影厅
  final Widget title; // 影院， 电影
  final Widget subtitle; // 简介

  final Widget trailing; // 拖尾的按钮，  更多

  @override
  _CustomListItemState createState() => _CustomListItemState();
}

class _CustomListItemState extends State<CustomListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        ListTile(
          title: widget.title,
          subtitle: widget.subtitle,
          trailing: widget.trailing,
        ),
        widget.child,
      ],
    ));
  }
}
