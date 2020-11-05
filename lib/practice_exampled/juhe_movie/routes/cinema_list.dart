import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:flutter_practice/practice_exampled/juhe_movie/routes/cinema_detail.dart';

class CinemaList extends StatefulWidget {
  CinemaList({Key key}) : super(key: key);

  @override
  _CinemaListState createState() => _CinemaListState();
}

class _CinemaListState extends State<CinemaList> {
  static const loadingTag = '##loading##';
  List data = [];
  List cinemas = [
    {'cinema_name': loadingTag}
  ];
  int page = 0;
  static int pageSize = 20;
  @override
  void initState() {
    Future<String> loadString =
        DefaultAssetBundle.of(context).loadString('data/cinema_list.json');
    loadString.then((value) {
      setState(() {
        data = json.decode(value);
      });
    });
    super.initState();
  }

  void _retrieveDate() {
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        cinemas.insertAll(cinemas.length - 1,
            data.getRange(page * pageSize, ++page * pageSize));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
        itemCount: cinemas.length,
        itemBuilder: (context, index) {
          if (cinemas[index]['cinema_name'] == loadingTag) {
            if (cinemas.length - 1 < data.length) {
              _retrieveDate();
              return Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: SizedBox(
                  width: 24.0,
                  height: 24.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 2.0,
                  ),
                ),
              );
            } else {
              return Container(
                padding: EdgeInsets.all(16.0),
                alignment: Alignment.center,
                child: Text(
                  '没有更多了',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            }
          }
          return ListTile(
            title: Text(cinemas[index]['cinema_name']),
            subtitle: Text(cinemas[index]['box_office']),
            onTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CinemaDetail(
                          title: cinemas[index]['cinema_name'],
                        ))),
          );
        },
        separatorBuilder: (context, index) => Divider(
          height: .0,
        ),
      ),
    );
  }
}
