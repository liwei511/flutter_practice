import 'package:flutter/material.dart';
import 'demo/index.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter实战'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  Widget build(BuildContext context) {
    // const demos = [
    //   {'key': 'counter', 'component': CounterDemo},
    //   {'key': 'use_package', 'component': CounterDemo},
    //   {'key': 'tapbox_state', 'component': CounterDemo},
    // ];
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: Scrollbar(
        child: ListView(
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
              child: Text(DemoTitle['scaffold']),
              textColor: Colors.blue,
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return ScaffoldDemo(title: DemoTitle['scaffold']);
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
          ],
        ),
      ),
    );
  }
}
