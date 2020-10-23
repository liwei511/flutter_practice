import 'package:flutter/material.dart';
import 'package:flutter_practice/practice_advanced/router/custom_gradient_arc_ex.dart';
import 'package:flutter_practice/practice_advanced/router/http_ex.dart';
import 'router/animation_decorated_ex.dart';
import 'router/animation_hero_example.dart';
import 'router/animation_stagger_ex.dart';
import 'router/animation_switch_ex.dart';
import 'router/event_bus_ex.dart';
import 'router/gesture_detector_ex.dart';
import 'router/pointer_event_ex.dart';
import 'router/notification_ex.dart';

// 动画
import 'router/animation_curved_ex.dart';
import 'router/animation_fade_route_ex.dart';

// custom
import 'router/custom_gradient_button_ex.dart';
import 'router/custom_gradient_arc_ex.dart';
import 'router/custom_progress_indicator_ex.dart';

import 'my_route.dart';

class MyRouteGroup {
  MyRouteGroup(
      {@required this.groupName,
      @required this.icon,
      @required this.routes,
      this.isExpanded});

  final String groupName;
  final Icon icon;
  final List<MyRoute> routes;
  bool isExpanded = false;
}

List<MyRouteGroup> myAppAdvancedRoutes = [
  MyRouteGroup(
      groupName: '事件处理与通知',
      icon: Icon(Icons.drag_handle),
      isExpanded: false,
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
  MyRouteGroup(
      groupName: '动画',
      icon: Icon(Icons.animation),
      isExpanded: false,
      routes: <MyRoute>[
        MyRoute(
          child: AnimationCurvedExample(),
          title: '动画结构',
        ),
        MyRoute(
          child: AnimationFadeRouteExmplate(),
          title: '自定义路由过渡动画',
        ),
        MyRoute(
          child: AnimationHeroExample(),
          title: 'hero动画',
        ),
        MyRoute(
          child: AnimationStaggerExample(),
          title: '交织动画',
        ),
        MyRoute(
          child: AnimationSwitchExample(),
          title: '动画切换',
        ),
        MyRoute(
          child: AnimationDecoratedExample(),
          title: '动画过渡组件',
        ),
      ]),
  MyRouteGroup(
      groupName: '自定义组件',
      icon: Icon(Icons.build_circle),
      isExpanded: false,
      routes: <MyRoute>[
        MyRoute(
          child: CustomGradientButtonExample(),
          title: '自定义渐变按钮',
        ),
        MyRoute(
          child: CustomGradientArcPainterExample(),
          title: '自定义环形进度条(web 不兼容)',
        ),
        MyRoute(
          child: GradientCircularProgressRoute(),
          title: '进度(web 不兼容)',
        ),
      ]),
  MyRouteGroup(
      groupName: '文件操作和网络请求',
      icon: Icon(Icons.attachment),
      isExpanded: false,
      routes: <MyRoute>[MyRoute(child: HttpExample(), title: 'http请求')]),
  MyRouteGroup(
      groupName: '包和插件',
      icon: Icon(Icons.backpack),
      isExpanded: false,
      routes: <MyRoute>[]),
  MyRouteGroup(
      groupName: '国际化',
      icon: Icon(Icons.local_airport),
      isExpanded: false,
      routes: <MyRoute>[]),
  MyRouteGroup(
      groupName: 'Flutter核心原理',
      icon: Icon(Icons.miscellaneous_services),
      isExpanded: false,
      routes: <MyRoute>[]),
];

class PracticeAdvancedPage extends StatefulWidget {
  PracticeAdvancedPageState createState() => PracticeAdvancedPageState();
}

class PracticeAdvancedPageState extends State {
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      child: ExpansionPanelList(
        expansionCallback: (int panelIndex, bool isExpanded) {
          setState(() {
            myAppAdvancedRoutes[panelIndex].isExpanded = !isExpanded;
          });
        },
        children: myAppAdvancedRoutes.map((group) {
          return ExpansionPanel(
            headerBuilder: (BuildContext context, bool isExpanded) {
              return ListTile(
                  leading: group.icon, title: Text(group.groupName));
            },
            body: Container(
              height: (group.routes.length * 50)
                  .toDouble(), // 这里必须告诉flutter高度， 否则不渲染
              child: ListView(
                padding: EdgeInsets.all(8),
                children: group.routes
                    .map((er) => ListTile(
                          title: Text(er.title),
                          onTap: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return er;
                          })),
                        ))
                    .toList(),
              ),
            ),
            isExpanded: group.isExpanded,
          );
        }).toList(),
      ),
    ));
  }
}
