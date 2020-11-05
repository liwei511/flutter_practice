import 'package:flutter/material.dart';
import 'package:flutter_practice/practice_exampled/juhe_movie/widgets/custom_list_item.dart';

// 影院详情， 影院在售影片列表
class CinemaDetail extends StatefulWidget {
  CinemaDetail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _CinemaDetailState createState() => _CinemaDetailState();
}

class _CinemaDetailState extends State<CinemaDetail> {
  List movies = [
    {
      "movie_id": 1258394,
      "movie_title": "名侦探柯南：绀青之拳",
      "release_date": "2019-09-13",
      "week": "周五",
      "release_days": 0,
      "ethan": "",
      "copy": "",
      "settlement": "",
      "secret_key": "",
      "box_office": "0.00"
    },
    {
      "movie_id": 1216447,
      "movie_title": "花椒之味",
      "release_date": "2019-09-12",
      "week": "周四",
      "release_days": 0,
      "ethan": "",
      "copy": "",
      "settlement": "",
      "secret_key": "",
      "box_office": "108873.15"
    },
    {
      "movie_id": 359377,
      "movie_title": "罗小黑战记",
      "release_date": "2019-09-12",
      "week": "周四",
      "release_days": 0,
      "ethan": "",
      "copy": "",
      "settlement": "",
      "secret_key": "",
      "box_office": "1681507.83"
    },
    {
      "movie_id": 1290438,
      "movie_title": "风吹吧麦浪",
      "release_date": "2019-09-10",
      "week": "周二",
      "release_days": 0,
      "ethan": "",
      "copy": "",
      "settlement": "",
      "secret_key": "",
      "box_office": "0.00"
    },
    {
      "movie_id": 1297360,
      "movie_title": "高兴逮笨贼",
      "release_date": "2019-09-06",
      "week": "周五",
      "release_days": 0,
      "ethan": "",
      "copy": "",
      "settlement": "",
      "secret_key": "",
      "box_office": "7000.00"
    },
    {
      "movie_id": 1205290,
      "movie_title": "检察方的罪人",
      "release_date": "2019-09-06",
      "week": "周五",
      "release_days": 0,
      "ethan": "",
      "copy": "",
      "settlement": "",
      "secret_key": "",
      "box_office": "0.00"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(widget.title),
              background:
                  Image.asset('assets/images/huanqiu.jpg', fit: BoxFit.cover),
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
                (context, index) => CustomListItem(
                      child: Text('几个影厅'),
                      title: Text(movies[index]['movie_title']),
                      subtitle: Text(movies[index]['release_date']),
                      trailing: Icon(Icons.more_vert),
                    ),
                childCount: movies.length),
          )
        ],
      ),
    );
  }
}
