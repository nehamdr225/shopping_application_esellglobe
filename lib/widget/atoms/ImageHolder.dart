import 'package:flutter/material.dart';
import 'package:esell/widget/atoms/centerText.dart';

class ImageHolder extends StatelessWidget {
  final image;
  ImageHolder({this.image});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      child: image != null
          ? Image.network(image,)
          : CenterText(
              text: "Image load failed",
              size: 12,
            ),
    );
  }
}
