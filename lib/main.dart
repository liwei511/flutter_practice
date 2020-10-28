import 'package:flutter/material.dart';
import 'practice_exampled/practice_exampled.dart';
import 'practice_advanced/practice_advanced.dart';
import 'practice_base/practice_base.dart';

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

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int selectedIndex = 1;
  TabController tabController;
  List tabs = ['投弹', '飞行', '爆炸'];

  void initState() {
    super.initState();
    tabController = TabController(
      length: tabs.length,
      vsync: this,
    );
  }

  Widget build(BuildContext context) {
    var one = [1, 2, 3];
    var two = [3, 4, 5];
    var item = one + two;
    one.addAll(true ? two : one);
    print(one);
    print(item);
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        bottom: TabBar(
          controller: tabController,
          tabs: tabs
              .map((e) => Tab(
                    text: e,
                  ))
              .toList(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Container(
            child: PracticeBasePage(),
          ),
          Container(
            child: PracticeAdvancedPage(),
          ),
          PracticeExampledPage(),
        ],
      ),
    );
  }
}
