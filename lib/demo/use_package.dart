import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class UsePackageDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('使用第三方包')
      ),
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          return Image.asset('assets/images/350x150.png', fit: BoxFit.fill,);
        },
        itemCount: 3,
        pagination: SwiperPagination(),
        control: SwiperControl(),
      )
    );
  }
}