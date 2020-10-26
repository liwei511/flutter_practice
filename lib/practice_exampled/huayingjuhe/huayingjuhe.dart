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

  // Response response;

  // List<dynamic> bannerData;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dio.options.baseUrl = 'https://api2.huayingjuhe.com';
  }

  // void getBanner() async {

  //   response = await _dio.post(
  //     'https://api2.huayingjuhe.com/news/get_banners',
  //     data: {'site': 1},
  //   );
  //   setState(() {
  //     bannerData = json.decode(response.data)['result'];
  //   });
  //   for (var i = 0; i < bannerData.length; i++) {
  //     print('https://ucs2.huayingjuhe.com' + bannerData[i]['url']);
  //   }

  //   print(1);
  // }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 650.0,
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
                  var bannerData = json.decode(response.data)['result'];
                  return Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        'https://ucs2.huayingjuhe.com' +
                            bannerData[index]['url'],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: bannerData == null ? 0 : bannerData.length,
                    pagination: SwiperPagination(),
                    control: SwiperControl(),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
          Padding(
              padding: EdgeInsets.all(42.0),
              child: Column(children: [
                Image.asset('images/huayingjuhe/logo.png'),
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
            height: 300.0,
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
                  var bannerData = json.decode(response.data)['result']['data'];
                  print(bannerData.length);
                  return Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Image.network(
                        'https://ucs2.huayingjuhe.com' +
                            bannerData[index]['poster'],
                        fit: BoxFit.fill,
                      );
                    },
                    itemCount: bannerData == null ? 0 : bannerData.length,
                    pagination: SwiperPagination(),
                    control: SwiperControl(),
                  );
                }
                return CircularProgressIndicator();
              },
            ),
          ),
        ],
      ),
    );
  }
}
