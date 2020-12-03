import '../index.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'dart:convert';

import 'package:flutter/foundation.dart';

class HomeRoute extends StatefulWidget {
  HomeRoute({Key key}) : super(key: key);

  @override
  _HomeRouteState createState() => _HomeRouteState();
}

class _HomeRouteState extends State<HomeRoute> {
  Dio _dio = new Dio();

  bool isPhone = defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;

  @override
  Widget build(
    BuildContext context,
  ) {
    // UserModel userModel = Provider.of<UserModel>(context);

    _dio.options.baseUrl = 'https://api2.huayingjuhe.com';

    return Scaffold(appBar: _buildAppbar(), body: _buildBody());
  }

  Widget _buildAppbar() {
    UserModel userModel = Provider.of<UserModel>(context);
    List<Widget> _actions = [
      FlatButton.icon(
        label: Text('使用帮助'),
        icon: Icon(Icons.help),
        onPressed: () {
          print(userModel.user?.toString());
          print(userModel.user?.login);
        },
      ),
      FlatButton.icon(
        label: Text('公众号'),
        icon: Icon(Icons.qr_code_scanner),
        onPressed: () {},
      ),
    ];

    _actions.addAll(userModel.isLogin
        ? [
            FlatButton.icon(
              label: Text('控制台'),
              icon: Icon(Icons.qr_code_scanner),
              onPressed: () {},
            ),
            PopupMenuButton(
              child: FlatButton.icon(
                color: Colors.black,
                label: Text(
                    userModel.user == null ? '用户名' : (userModel.user?.login)),
                icon: Icon(Icons.person),
                onPressed: null,
              ),
              // icon: Icon(Icons.person),
              itemBuilder: (context) => [
                PopupMenuItem(
                  child: Text('设置密码'),
                  value: 0,
                ),
                PopupMenuItem(
                  child: Text('退出登录'),
                  value: 1,
                ),
              ],
              onSelected: (result) {
                if (result == 0) {
                  // 设置密码页
                } else {
                  // 退出登录
                  setState(() {
                    userModel.user = null;
                  });
                }
              },
              tooltip: null,
            ),
          ]
        : [
            FlatButton.icon(
              label: Text('登录'),
              icon: Icon(Icons.login),
              onPressed: () {
                Navigator.of(context).pushNamed('login');
              },
            ),
          ]);
    return AppBar(
        backgroundColor: Colors.white,
        title: Image.asset('assets/images/huayingjuhe/huayingjuhe.png'),
        actions: _actions);
  }

  Widget _buildBody() {
    List<Widget> serveWidget = [
      {
        'image': 'assets/images/huayingjuhe/neirong.png',
        'title': '内容分发',
        'content': '密钥发布 | 硬盘递运 | 网络传输'
      },
      {
        'image': 'assets/images/huayingjuhe/shujufenxi.png',
        'title': '数据分析',
        'content': '票房统计 | 票房结算 | 票房预测 | 档期评估 | 市场复盘'
      },
      {
        'image': 'assets/images/huayingjuhe/mubanzhizuo.png',
        'title': '内容整合',
        'content': '母版制作 | 数字拷贝 | 媒资管理'
      },
    ].map((e) {
      return Container(
        width: 280.0,
        child: Column(
          children: [
            Image.asset(e['image']),
            Container(
              height: 60.0,
              alignment: Alignment.center,
              child: Text(
                e['title'],
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
              ),
            ),
            Text(e['content'],
                style: TextStyle(color: Colors.grey[500], fontSize: 12.0)),
          ],
        ),
      );
    }).toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            // 放到。。里
            height: isPhone ? 200.0 : 650.0,
            child: FutureBuilder(
              future: _dio.post(
                '/news/get_banners',
                data: {'site': 1},
              ),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  Response response = snapshot.data;
                  if (snapshot.hasError) {
                    return Text(snapshot.error.toString());
                  }
                  List bannerList = json.decode(response.data)['result'];
                  return Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                          child: AspectRatio(
                              aspectRatio: 4.0 / 3.0,
                              child: Image.network(
                                'https://ucs2.huayingjuhe.com' +
                                    bannerList[index]['url'],
                                fit: BoxFit.cover,
                              )));
                    },
                    itemCount: bannerList == null ? 0 : bannerList.length,
                    pagination: SwiperPagination(),
                    control: SwiperControl(),
                    autoplay: true,
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.all(42.0),
              child: Column(children: [
                Image.asset('assets/images/huayingjuhe/logo.png'),
                Container(
                  height: 100.0,
                  alignment: Alignment.center,
                  child: Text(
                    '全国电影发行数据平台',
                    style: TextStyle(fontSize: 42.0),
                  ),
                )
              ])),
          Container(
              decoration: BoxDecoration(color: Colors.grey[100]),
              child: Padding(
                  padding: EdgeInsets.all(42.0),
                  child: Container(
                    height: 300.0,
                    width: 1200.0,
                    child: FutureBuilder(
                      future: _dio.post(
                        '/news/get_movies',
                        data: {'pagesize': 50},
                      ),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          Response response = snapshot.data;
                          if (snapshot.hasError) {
                            return Text(snapshot.error.toString());
                          }
                          List movieList =
                              json.decode(response.data)['result']['data'];
                          return Swiper(
                            itemBuilder: (BuildContext context, int index) {
                              return Container(
                                  width: 300,
                                  height: 400,
                                  child: AspectRatio(
                                      aspectRatio: 4.0 / 3.0,
                                      child: Image.network(
                                        'https://ucs2.huayingjuhe.com' +
                                            movieList[index]['poster'],
                                        fit: BoxFit.cover,
                                      )));
                            },
                            itemCount: movieList == null ? 0 : movieList.length,
                            pagination: SwiperPagination(),
                            control: SwiperControl(),
                            viewportFraction: isPhone ? 0.8 : 0.2,
                            scale: 0.7,
                            // itemHeight: 300.0,
                            // itemWidth: 250.0,
                            // layout: SwiperLayout.TINDER,
                            autoplay: true,
                          );
                        }
                        return CircularProgressIndicator();
                      },
                    ),
                  ))),
          Padding(
              padding: EdgeInsets.all(42.0),
              child: Column(children: [
                Container(
                  height: 100.0,
                  alignment: Alignment.center,
                  child: Text(
                    '了解我们的服务',
                    style: TextStyle(fontSize: 42.0),
                  ),
                ),
                Center(
                    child: SizedBox(
                  height: 300.0,
                  width: 1000.0,
                  child: isPhone
                      ? Column(
                          children: serveWidget,
                          crossAxisAlignment: CrossAxisAlignment.center,
                        )
                      : Row(
                          children: serveWidget,
                          mainAxisAlignment: MainAxisAlignment.center,
                        ),
                ))
              ])),
          Container(
            decoration: BoxDecoration(color: Colors.blueGrey[800]),
            child: Padding(
                padding: EdgeInsets.all(42.0),
                child: Column(children: [
                  Container(
                    alignment: Alignment.center,
                    height: 30.0,
                    child: Text(
                      '微信公众号 huayingjuhe   联系邮箱 support@huayingjuhe.com',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30.0,
                    child: Text(
                      '客服电话 4001-600-300   客服时间 周一至周五 9:30 - 18:30，周末及节假日 12:00 - 16:00',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 30.0,
                    child: Text(
                      'Copyright 2013 - 2018 北京华影聚合电影科技有限公司 All Rights Reserved',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    child: Text(
                      '京公网安备 11010802026718 号    |   京ICP备 15065858 号',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 12.0, color: Colors.white),
                    ),
                  ),
                ])),
          )
        ],
      ),
    );
  }

  @override
  void didChangeDependencies() {
    print('状态更新了');
    super.didChangeDependencies();
  }
}
