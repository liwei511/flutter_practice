import 'package:flutter/material.dart';
import 'demo/index.dart';

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
            child: Text(DemoTitle['will_popscope']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return WillPopScopeDemo(title: DemoTitle['will_popscope']);
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
            child: Text(DemoTitle['custom_scroll']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CustomScrollViewDemo(title: DemoTitle['custom_scroll']);
              }));
            },
          ),
          FlatButton(
            child: Text(DemoTitle['scroll_controller']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ScrollControllerDemo(
                    title: DemoTitle['scroll_controller']);
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
            child: Text(DemoTitle['alert_dialog']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return AlertDialogDemo(title: DemoTitle['alert_dialog']);
              }));
            },
          ),
        ],
      ),
    );
  }
}
