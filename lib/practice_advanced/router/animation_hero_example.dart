import 'package:flutter/material.dart';

class AnimationHeroExample extends StatelessWidget {
  const AnimationHeroExample({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: InkWell(
        child: Hero(
          tag: 'avatar',
          child: ClipOval(
            child: Image.asset('assets/images/sliverappbar.jpg', width: 50.0),
          ),
        ),
        onTap: () => Navigator.push(context, PageRouteBuilder(pageBuilder:
            (BuildContext context, Animation animation,
                Animation secondaryAnimation) {
          return FadeTransition(
              opacity: animation,
              child: Scaffold(
                appBar: AppBar(
                  title: Text('原图'),
                ),
                body: HeroAnimationRouteB(),
              ));
        })),
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget {
  const HeroAnimationRouteB({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(
        tag: 'avatar',
        child: Image.asset('assets/images/sliverappbar.jpg'),
      ),
    );
  }
}
