import 'package:flutter/material.dart';

class Stars extends StatelessWidget {
  final Color color;
  final double size;
  final double rate;
  final MainAxisAlignment mainAxisAlignment;
  Stars(
      {this.color,
      this.size,
      this.mainAxisAlignment: MainAxisAlignment.end,
      this.rate});
  @override
  Widget build(BuildContext context) {
    final int rounded = rate.floor();
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: <Widget>[
        ...List.generate(
          rounded,
          (index) => Icon(
            Icons.star,
            color: color,
            size: size,
          ),
        ),
        if (rate - rounded > 0)
          Icon(
            Icons.star_half,
            color: color,
            size: size,
          ),
      ],
    );
  }
}
