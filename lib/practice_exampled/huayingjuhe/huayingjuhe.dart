import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class Huayingjuhe extends StatefulWidget {
  Huayingjuhe({Key key}) : super(key: key);

  @override
  _HuayingjuheState createState() => _HuayingjuheState();
}

class _HuayingjuheState extends State<Huayingjuhe> {
  Dio _dio = new Dio();

  Response response;

  List<dynamic> bannerData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBanner();
  }

  void getBanner() async {
    // response = await _dio.get('https://api.github.com/orgs/flutterchina/repos');
    // print(response.data is String); // false

    response = await _dio.post(
      'https://api2.huayingjuhe.com/news/get_banners',
      data: {'site': 1},
    );
    print(response.data);
    var t = json.decode(response.data);
    var h = jsonDecode(response.data);
    print(h);
    // 这里不能用 t.result
    print(t);
    print(t['result']);
    print(t['result'] is String);
    bannerData = t['result'];
    for (var i = 0; i < bannerData.length; i++) {
      print(bannerData[i]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 200.0,
            child: Swiper(
              itemBuilder: (BuildContext context, int index) {
                return Image.asset(
                  'assets/images/lifecycle.jpg',
                  fit: BoxFit.fill,
                );
              },
              itemCount: 3,
              pagination: SwiperPagination(),
              control: SwiperControl(),
            ),
          )
        ],
      ),
    );
  }
}
