import 'package:flutter/material.dart';

class ImageHolder extends StatelessWidget {
  final image;
  ImageHolder({this.image});
  @override
  Widget build(BuildContext context) {
    print(image);
    return Container(
      height: 130,
      child: image != null ? Image.network(image) : Text("image load failed"),
    );
  }
}
