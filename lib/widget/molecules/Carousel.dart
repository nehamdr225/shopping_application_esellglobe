import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class FCarousel extends StatelessWidget {
  // final List <AssetImage> images;
  // FCarousel({this.images});
  Widget build(BuildContext context) {
    return Container(
      height: 350.0,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: [
          AssetImage('images/heroimg4.jpeg'),
          AssetImage('images/heroimg1.jpeg'),
          AssetImage('images/heroimg2.jpeg'),
          AssetImage('images/heroimg3.jpeg'),
        ],
        animationCurve: Curves.ease,
        autoplay: false,
        dotSize: 6.0,
        overlayShadowColors: Color(0xff0d47a1),
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 12.0,
      ),
    );
  }
}
