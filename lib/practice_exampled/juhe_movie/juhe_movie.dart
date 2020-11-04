import 'package:flutter/material.dart';
import './routes/index.dart';

class JuheMovie extends StatefulWidget {
  JuheMovie({Key key}) : super(key: key);

  @override
  _JuheMovieState createState() => _JuheMovieState();
}

class _JuheMovieState extends State<JuheMovie>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  List tabs = [
    {'title': '选影片', 'child': MovieList()},
    {'title': '选影院', 'child': CinemaList()},
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('聚合电影-静态版'),
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs
                .map((e) => Tab(
                      text: e['title'],
                    ))
                .toList()),
      ),
      body: TabBarView(
        controller: _tabController,
        children: tabs.map((e) {
          return Container(child: e['child']);
        }).toList(),
      ),
    );
  }
}
