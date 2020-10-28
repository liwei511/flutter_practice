import 'package:flutter/material.dart';
import 'package:flutter_practice/practice_exampled/github_client/github_client.dart';
import 'package:flutter_practice/practice_exampled/modals/route.dart';
import './index.dart';

class PracticeExampledPage extends StatelessWidget {
  final List<RouteModal> routes = [
    RouteModal(
      '五子棋(未完成)',
      FiveInARowExampled(),
    ),
    RouteModal(
      '华影聚合(Web)',
      Huayingjuhe(),
    ),
    RouteModal('github 客户端', GithubClient())
    // {
    //   'child': Huayingjuhe(),
    //   'title': '华影聚合(Web)',
    // },
  ];
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.all(8),
      children: routes
          .map((er) => ListTile(
                title: Text(er.title),
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return er.child;
                })),
              ))
          .toList(),
    );
  }
}

// TODO:  写一个package， 包含主页架构， siteinfo， 主题等。在 main.dart 里代替 Scaffold
