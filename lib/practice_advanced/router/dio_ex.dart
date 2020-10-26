import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

class DioExample extends StatefulWidget {
  DioExample({Key key}) : super(key: key);

  @override
  _DioExampleState createState() => _DioExampleState();
}

class _DioExampleState extends State<DioExample> {
  Dio _dio = new Dio();
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            Response response = snapshot.data;
            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            return ListView(
              children: response.data
                  .map<Widget>((e) => ListTile(
                        title: Text(e['full_name']),
                      ))
                  .toList(),
            );
          }
          // 请求未完成时弹出loading
          return CircularProgressIndicator();
        },
        future: _dio.get('https://api.github.com/orgs/flutterchina/repos'),
      ),
    );
  }
}
