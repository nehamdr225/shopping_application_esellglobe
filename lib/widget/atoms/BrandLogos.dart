import 'package:flutter/material.dart';

class BrandLogos extends StatelessWidget {
  final image;
  final height;
  final width;
  BrandLogos({this.image, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.0,
      width: 60.0,
      child: Image.asset('images/myntralogo.png'),
    );
  }
}
