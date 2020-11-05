import 'package:flutter/material.dart';
import 'package:flutter_practice/practice_exampled/juhe_movie/widgets/custom_list_item.dart';

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

  List cinemas = [
    {
      "cinema_code": 11010101,
      "cinema_name": "百老汇影城（apm购物中心店）",
      "box_office": "60362.00"
    },
    {
      "cinema_code": 11010201,
      "cinema_name": "新影联东环影城",
      "box_office": "27996.00"
    },
    {
      "cinema_code": 11010301,
      "cinema_name": "百老汇影城（东方广场店）",
      "box_office": "75065.00"
    },
    {
      "cinema_code": 11010521,
      "cinema_name": "沃美影城（回龙观店）",
      "box_office": "88466.00"
    },
    {
      "cinema_code": 11010661,
      "cinema_name": "耀莱成龙影城（王府井店）",
      "box_office": "51365.00"
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
                crossAxisSpacing: .0,
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
          SliverList(
            // itemExtent: 120,
            delegate: SliverChildBuilderDelegate(
              (context, index) => CustomListItem(
                child: Text('几个影厅'),
                title: Text(cinemas[index]['cinema_name']),
                subtitle: Text(cinemas[index]['box_office']),
                trailing: Icon(Icons.more_vert),
              ),
              childCount: cinemas.length,
            ),
          ),
        ],
      ),
    );
  }
}
