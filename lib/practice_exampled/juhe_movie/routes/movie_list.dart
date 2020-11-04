import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practice/practice_exampled/juhe_movie/routes/index.dart';

class MovieList extends StatefulWidget {
  MovieList({Key key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  static const loadingTag = '##loading##';
  List data = [];
  List movies = [
    {'movie_title': loadingTag}
  ];
  int page = 0;
  static int pageSize = 20;

  @override
  void initState() {
    Future<String> loadString =
        DefaultAssetBundle.of(context).loadString('data/movie_list.json');
    loadString.then((value) {
      setState(() {
        data = json.decode(value);
      });
    });
    super.initState();
  }

  void _retrieveData() {
    Future.delayed(Duration(seconds: 1)).then((value) {
      setState(() {
        movies.insertAll(movies.length - 1,
            data.getRange(page * pageSize, ++page * pageSize));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: ListView.separated(
        itemCount: movies.length,
        itemBuilder: (context, index) {
          if (movies[index]['movie_title'] == loadingTag) {
            if (movies.length - 1 < data.length) {
              _retrieveData();
              // 加载中
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
            title: Text(movies[index]['movie_title']),
            subtitle: Text(movies[index]['release_date']),
            onTap: () => Navigator.push(context, 
              MaterialPageRoute(builder: (context) {
                return MovieDetail(title: movies[index]['movie_title']);
              })
            ),
          );
        },
        separatorBuilder: (context, index) => Divider(
          height: .5,
        ),
      ),
    );
  }
}
