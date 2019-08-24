import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class PDCarousel extends StatelessWidget {
  final List<AssetImage> images;
  PDCarousel({this.images});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Carousel(
        boxFit: BoxFit.contain,
        images: images,
        autoplay: false,
        dotSize: 6.0,
        overlayShadowColors: Color(0xff0d47a1),
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 12.0,
      ),
    );
  }
}
