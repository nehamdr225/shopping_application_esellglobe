import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final Color color;
  final double size;
  final MainAxisAlignment mainAxisAlignment;
  Stars({this.color, this.size, this.mainAxisAlignment: MainAxisAlignment.end});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: <Widget>[
        Icon(Icons.star, color: color, size: size,),
        Icon(Icons.star, color: color, size: size,),
        Icon(Icons.star, color: color, size: size,),
        Icon(Icons.star, color: color, size: size,),
        Icon(Icons.star_half, color: color, size: size,),
      ],
    );
  }
}
