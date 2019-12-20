import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

class PDCarousel extends StatelessWidget {
  final width;
  final List<Image> images;
  PDCarousel({this.images, this.width}); //
  @override
  Widget build(BuildContext context) {
    return Container(
      //width: width,
      child: Carousel(
        boxFit: BoxFit.fill,
        images: images,
        autoplay: false,
        dotSize: 6.0,
        animationDuration: Duration(seconds: 2),
        overlayShadowColors: Color(0xff0d47a1),
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 12.0,
      ),
    );
  }
}
