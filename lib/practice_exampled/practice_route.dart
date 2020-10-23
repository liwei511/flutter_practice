import 'package:flutter/material.dart';

class PracticeRoute extends StatelessWidget {
  final Widget child;
  final String title;

  const PracticeRoute({@required this.child, this.title}); // Const变量必须用常数值初始化。

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      body: this.child,
    );
  }
}
