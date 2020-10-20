import 'package:flutter/material.dart';

class ScrollControllerDemo extends StatefulWidget {
  ScrollControllerDemo({Key key, this.title}) : super(key: key);
  final String title;

  State<StatefulWidget> createState() => ScrollControllerDemoState();
}

class ScrollControllerDemoState extends State<ScrollControllerDemo> {
  ScrollController controller = new ScrollController();
  bool showToTopBtn = false; // 是否显示返回顶部按钮

  // 初始函数里添加监听事件
  void initState() {
    super.initState();
    controller.addListener(() {
      if (controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (controller.offset >= 1000 && !showToTopBtn) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Scrollbar(
          child: ListView.builder(
            itemCount: 100,
            itemExtent: 50.0, // 若列表高度固定， 应该显式指定列高， 性能消耗小
            controller: controller,
            itemBuilder: (context, index) => ListTile(
              title: Text('$index'),
            ),
          ),
        ),
        floatingActionButton: showToTopBtn
            ? FloatingActionButton(
                child: Icon(Icons.arrow_upward),
                onPressed: () => controller.animateTo(.0,
                    duration: Duration(milliseconds: 200), curve: Curves.ease),
              )
            : null);
  }
}
