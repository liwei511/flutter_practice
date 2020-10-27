import 'package:flutter/material.dart';
import './index.dart';
import './practice_route.dart';

class PracticeExampledPage extends StatelessWidget {
  final routes = [
    PracticeRoute(
      child: FiveInARowExampled(),
      title: '五子棋(未完成)',
    ),
    PracticeRoute(
      child: Huayingjuhe(),
      title: '华影聚合(Web)',
    ),
  ];
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8),
      children: routes
          .map((er) => ListTile(
                title: Text(er.title),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return er;
                })),
              ))
          .toList(),
    );
  }
}

// todo
// 写一个package， 包含主页架构， siteinfo， 主题等。
// 在 main.dart 里代替 Scaffold
