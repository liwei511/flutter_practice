import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'index.dart';

class UsePackageDemo extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(DemoTitle['use_package'])
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