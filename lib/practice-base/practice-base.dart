import 'package:flutter/material.dart';
import 'demo/index.dart';

const DemoTitle = {
  'counter': '计数器示例',
  'use_package': '使用第三方包示例',
  'tapbox_state': '状态管理',
  'base_widget': '基础组件',
  'style': '布局类组件',
  'scaffold': 'scaffold，导航',
  'will-popscope': '导航返回拦截',
  'listview': '滚动加载列表',
  'custom-scroll': 'CustomScrollView',
  'scroll-controller': '滚动监听及控制',
  'theme': '主题切换',
  'alert-dialog': '对话框',
};

class PracticeBasePage extends StatelessWidget {
  Widget build(BuildContext context) {
    // const demos = [
    //   {'key': 'counter', 'component': CounterDemo},
    //   {'key': 'use_package', 'component': CounterDemo},
    //   {'key': 'tapbox_state', 'component': CounterDemo},
    // ];
    return Scrollbar(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.all(20.0),
        children: [
          FlatButton(
            child: Text(DemoTitle['counter']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CounterDemo(title: DemoTitle['counter']);
              }));
            },
          ),
          FlatButton(
            child: Text(DemoTitle['use_package']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return UsePackageDemo(title: DemoTitle['use_package']);
              }));
            },
          ),
          FlatButton(
            child: Text(DemoTitle['tapbox_state']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return TapboxDemo(title: DemoTitle['tapbox_state']);
              }));
            },
          ),
          FlatButton(
            child: Text(DemoTitle['base_widget']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return BaseWidgetDemo(title: DemoTitle['base_widget']);
              }));
            },
          ),
          FlatButton(
            child: Text(DemoTitle['style']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return StyleDemo(title: DemoTitle['style']);
              }));
            },
          ),
          FlatButton(
            child: Text(DemoTitle['will-popscope']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return WillPopScopeDemo(title: DemoTitle['will-popscope']);
              }));
            },
          ),
          FlatButton(
            child: Text(DemoTitle['listview']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ListViewDemo(title: DemoTitle['listview']);
              }));
            },
          ),
          FlatButton(
            child: Text(DemoTitle['scaffold']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ScaffoldDemo(title: DemoTitle['scaffold']);
              }));
            },
          ),
          FlatButton(
            child: Text(DemoTitle['custom-scroll']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CustomScrollViewDemo(title: DemoTitle['custom-scroll']);
              }));
            },
          ),
          FlatButton(
            child: Text(DemoTitle['scroll-controller']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ScrollControllerDemo(
                    title: DemoTitle['scroll-controller']);
              }));
            },
          ),
          FlatButton(
            child: Text(DemoTitle['theme']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ThemeDemo(title: DemoTitle['theme']);
              }));
            },
          ),
          FlatButton(
            child: Text(DemoTitle['alert-dialog']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AlertDialogDemo(title: DemoTitle['alert-dialog']);
              }));
            },
          ),
        ],
      ),
    );
  }
}
