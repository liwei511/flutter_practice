import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class UsePackageDemo extends StatelessWidget {
  UsePackageDemo({Key key, this.title}) : super(key: key);
  final String title;

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return Image.asset(
              'assets/images/lifecycle.jpg',
              fit: BoxFit.fill,
            );
          },
          itemCount: 3,
          pagination: SwiperPagination(),
          control: SwiperControl(),
        ));
  }
}
