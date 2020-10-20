import 'package:flutter/material.dart';
import 'package:flutter_practice/practice-advanced/router/event-bus-ex.dart';
import 'package:flutter_practice/practice-advanced/router/gesture-detector-ex.dart';
import 'package:flutter_practice/practice-advanced/router/pointer-event-ex.dart';
import 'package:flutter_practice/practice-advanced/router/notification-ex.dart';
import 'my-route.dart';
import 'my-expansion-panel.dart';

class MyRouteGroup {
  MyRouteGroup(
      {@required this.groupName,
      @required this.icon,
      @required this.routes,
      this.isExpanded});

  final String groupName;
  final Widget icon;
  final List<MyRoute> routes;
  bool isExpanded = false;
}

List<MyRouteGroup> myAppAdvancedRoutes = [
  MyRouteGroup(
      groupName: '事件处理与通知',
      icon: Icon(Icons.drag_handle),
      routes: <MyRoute>[
        MyRoute(
          child: PointerEventExample(),
          title: '原始指针事件处理',
        ),
        MyRoute(
          child: GestureDetectorExample(),
          title: '手势识别',
        ),
        MyRoute(
          child: EventBusExample(),
          title: '全局事件总线',
        ),
        MyRoute(
          child: NotificationExample(),
          title: '通知(Notification)',
        ),
      ]),
  MyRouteGroup(groupName: '动画', icon: Icon(Icons.animation), routes: <MyRoute>[
    MyRoute(
      child: PointerEventExample(),
      title: '动画结构',
    ),
    MyRoute(
      child: GestureDetectorExample(),
      title: '自定义路由过渡动画',
    ),
    MyRoute(
      child: EventBusExample(),
      title: 'hero动画',
    ),
    MyRoute(
      child: NotificationExample(),
      title: '交织动画',
    ),
    MyRoute(
      child: NotificationExample(),
      title: '动画过渡组件',
    ),
  ]),
];

class PracticeAdvancedPage extends StatefulWidget {
  PracticeAdvancedPageState createState() => PracticeAdvancedPageState();
}

class PracticeAdvancedPageState extends State {
  Widget build(BuildContext context) {
    // const demos = [
    //   {'key': 'counter', 'component': CounterDemo},
    //   {'key': 'use_package', 'component': CounterDemo},
    //   {'key': 'tapbox_state', 'component': CounterDemo},
    // ];
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ExpansionPanelList(
        expansionCallback: (int panelIndex, bool isExpanded) {},
        children: myAppAdvancedRoutes.map((group) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(title: Text(group.groupName));
            },
            body: ListView(
              padding: EdgeInsets.all(8),
              children: group.routes
                  .map((er) => ListTile(title: Text(er.title)))
                  .toList(),
            ),
            isExpanded: false,
          );
        }).toList(),
      ),
    );
  }
}
