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
    print(2);
    // return Swiper(
    //   itemBuilder: (BuildContext context, int index) {
    //     return Image.asset(
    //       'assets/images/lifecycle.jpg',
    //       fit: BoxFit.fill,
    //     );
    //   },
    //   itemCount: 3,
    //   pagination: SwiperPagination(),
    //   control: SwiperControl(),
    // );
    return FutureBuilder(
      future: _dio.post(
        'https://api2.huayingjuhe.com/news/get_banners',
        data: {'site': 1},
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Response response = snapshot.data;
          if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          }
          print(response);
          var bannerData = json.decode(response.data)['result'];
          print(bannerData.length);
          return Swiper(
            itemBuilder: (BuildContext context, int index) {
              // return Image.asset(
              //   'assets/images/lifecycle.jpg',
              //   fit: BoxFit.fill,
              // );
              return Image.network(
                'https://ucs2.huayingjuhe.com' + bannerData[index]['url'],
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
    );
  }
}
