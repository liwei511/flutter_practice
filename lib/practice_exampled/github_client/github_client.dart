/*
 * common	一些工具类，如通用方法类、网络接口类、保存全局变量的静态类等
 * l10n	国际化相关的类都在此目录下
 * models	Json文件对应的Dart Model类会在此目录下
 * states	保存APP中需要跨组件共享的状态类
 * routes	存放所有路由页面类
 * widgets	APP内封装的一些Widget组件都在该目录下
 * 
 * jsons 用于保存Json文件, 可以放到lib外
 */

import 'package:flutter/material.dart';

class GithubClient extends StatelessWidget {
  const GithubClient({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Github客户端'),
        actions: [],
      ),
    );
  }
}
