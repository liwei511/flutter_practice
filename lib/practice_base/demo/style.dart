import 'package:flutter/material.dart';

class StyleDemo extends StatelessWidget {
  StyleDemo({Key key, this.title}) : super(key: key);
  final String title;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Column(children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[Text('线性布局 Row'), Text('I am Wai')],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [Text('线性布局 Column'), Text('World')],
          ),
          Text('Flex的两个子widget按1：2来占据水平空间 '),
          Flex(
            direction: Axis.horizontal,
            children: [
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 30.0,
                    color: Colors.red,
                  )),
              Expanded(
                  flex: 2,
                  child: Container(
                    height: 30.0,
                    color: Colors.green,
                  )),
            ],
          ),
          Text('Flex的三个子widget，在垂直方向按2：1：1来占用100像素的空间'),
          Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: SizedBox(
                height: 100.0,
                child: Flex(
                  direction: Axis.vertical,
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          height: 30.0,
                          color: Colors.red,
                        )),
                    Spacer(
                      flex: 1,
                    ),
                    Expanded(
                        child: Container(
                      height: 30.0,
                      color: Colors.green,
                    ))
                  ],
                )),
          ),
          Text('流式布局 Wrap Flow'),
          Wrap(
              spacing: 8.0,
              runSpacing: 4.0,
              alignment: WrapAlignment.center,
              children: [
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('A')),
                  label: new Text('Hamilton'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('M')),
                  label: new Text('Lafayette'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('H')),
                  label: new Text('Mulligan'),
                ),
                new Chip(
                  avatar: new CircleAvatar(
                      backgroundColor: Colors.blue, child: Text('J')),
                  label: new Text('Laurens'),
                ),
              ]),
          Flow(
            delegate: TestFlowDelegate(margin: EdgeInsets.all(10.0)),
            children: <Widget>[
              new Container(
                width: 80.0,
                height: 80.0,
                color: Colors.red,
              ),
              new Container(
                width: 80.0,
                height: 80.0,
                color: Colors.green,
              ),
              new Container(
                width: 80.0,
                height: 80.0,
                color: Colors.blue,
              ),
              new Container(
                width: 80.0,
                height: 80.0,
                color: Colors.yellow,
              ),
              new Container(
                width: 80.0,
                height: 80.0,
                color: Colors.brown,
              ),
              new Container(
                width: 80.0,
                height: 80.0,
                color: Colors.purple,
              ),
            ],
          )
        ]));
  }
}

class TestFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  TestFlowDelegate({this.margin});
  @override
  void paintChildren(FlowPaintingContext context) {
    double x = margin.left;
    double y = margin.top;
    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      double w = context.getChildSize(i).width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += context.getChildSize(i).height + margin.top + margin.bottom;
        //绘制子widget(有优化)
        context.paintChild(i,
            transform: new Matrix4.translationValues(x, y, 0.0));
        x += context.getChildSize(i).width + margin.left + margin.right;
      }
    }
  }

  @override
  getSize(BoxConstraints constraints) {
    //指定Flow的大小
    return Size(double.infinity, 200.0);
  }

  @override
  bool shouldRepaint(FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}
