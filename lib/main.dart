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
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title)
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          FlatButton(
            child: Text(DemoTitle['counter']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) {
                  return CounterDemo();
                })
              );
            },
          ),
          FlatButton(
            child: Text(DemoTitle['use_package']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) {
                  return UsePackageDemo();
                })
              );
            }, 
          ),
          FlatButton(
            child: Text(DemoTitle['tapbox_state']),
            textColor: Colors.blue,
            onPressed: () {
              Navigator.push(context, 
                MaterialPageRoute(builder: (context) {
                  return TapboxDemo();
                })
              );
            }, 
          ),
        ]
      ),
    );
  }
}


