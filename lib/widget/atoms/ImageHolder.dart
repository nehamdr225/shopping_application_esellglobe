import 'package:flutter/material.dart';

class ImageHolder extends StatelessWidget {
  final image;
  ImageHolder({this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: Image.asset(image),
    );
  }
}
