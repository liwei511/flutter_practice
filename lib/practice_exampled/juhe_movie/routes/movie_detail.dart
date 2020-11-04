import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget {
  MovieDetail({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MovieDetailState createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail> {
  List<List<String>> info = [
    ['导演', '陈浩 饺子'],
    ['主演', '陈浩 绿绮 囧森瑟夫'],
    ['片长', '110分种'],
    ['类型', '动画'],
    ['豆瓣评分', '8.0'],
    ['语言', '中文'],
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
              background: Image.asset(
                'assets/images/sliverappbar.jpg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.all(8.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 4.0,
              ),
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) => Container(
                    alignment: Alignment.centerLeft,
                    // color: Colors.cyan[100 * (index % 9)],
                    child: Text.rich(
                      TextSpan(children: [
                        TextSpan(
                            text: info[index][0] + ': ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(text: info[index][1])
                      ]),
                    )),
                childCount: info.length,
              ),
            ),
          ),
          SliverFixedExtentList(
            itemExtent: 20,
            delegate: SliverChildBuilderDelegate(
              (context, index) => Container(
                alignment: Alignment.center,
                child: Text('影院$index'),
              ),
              childCount: 50,
            ),
          ),
        ],
      ),
    );
  }
}
