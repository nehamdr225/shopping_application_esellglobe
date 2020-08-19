import 'package:flutter/material.dart';

class BrandLogos extends StatelessWidget {
  final image;
  final height;
  final width;
  BrandLogos({this.image, this.height: 60.0, this.width: 60.0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Image.asset('images/logo/logoonly.png', color: Colors.white,),
    );
  }
}
