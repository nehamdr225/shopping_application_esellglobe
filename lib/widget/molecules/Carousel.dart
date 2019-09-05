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
          AssetImage('images/heroimg1_1_28.jpg'),
          AssetImage('images/heroimg6_40.jpg'),
          AssetImage('images/heroimg2_35.jpg'),
          AssetImage('images/heroimg3_40.jpg'),
          AssetImage('images/heroimg5_29.jpg'),
        ],
        animationCurve: Curves.ease,
        autoplay: true,
        animationDuration: Duration(milliseconds: 900),
        dotSize: 6.0,
        overlayShadowColors: Color(0xff0d47a1),
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 12.0,
      ),
    );
  }
}
