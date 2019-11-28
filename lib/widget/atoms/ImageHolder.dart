import 'package:flutter/material.dart';
import 'package:esell/widget/atoms/centerText.dart';

class ImageHolder extends StatelessWidget {
  final image;
  final imgheight;
  ImageHolder({this.image, this.imgheight});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: imgheight,
      child: image != null
          ? Image.network(image)
          : CenterText(
              text: "Image load failed",
              size: 12,
            ),
    );
  }
}
