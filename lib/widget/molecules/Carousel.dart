import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class FCarousel extends StatelessWidget {
  // final List <AssetImage> images;
  // FCarousel({this.images});
  Widget build(BuildContext context) {
    return Container(
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('images/myntra images/sc/hero1.jpg'),
          AssetImage('images/myntra images/sc/hero2.jpg'),
          AssetImage('images/myntra images/sc/hero3.jpg'),
          AssetImage('images/myntra images/sc/hero4.jpg'),
          AssetImage('images/myntra images/sc/hero5.jpg'),
        ],
        animationCurve: Curves.ease,
        autoplay: true,
        animationDuration: Duration(seconds: 1),
        dotSize: 6.0,
        overlayShadowColors: Color(0xff0d47a1),
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 12.0,
      ),
    );
  }
}
