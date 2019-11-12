import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';

class FCarousel extends StatelessWidget {
  // final List <AssetImage> images;
  // FCarousel({this.images});
  Widget build(BuildContext context) {
    return Container(
      child: Carousel(
        boxFit: BoxFit.fitHeight,
        images: [
          AssetImage("images/esell photo/1black_vert.jpg",),
          AssetImage("images/esell photo/7red_vert.jpg",),
          AssetImage("images/esell photo/10beach_vert.jpeg"),
          AssetImage("images/esell photo/2bnw_vert.jpg"),
          AssetImage("images/esell photo/9black_vert.jpeg",),
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
