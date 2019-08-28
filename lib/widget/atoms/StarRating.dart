import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PDStarRating extends StatelessWidget {
  final double rating;
  PDStarRating({this.rating});
  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
      allowHalfRating: true,
      onRatingChanged: (v) {},
      starCount: 5,
      rating: rating,
      size: 28.0,
      color: Colors.yellow,
      borderColor: Colors.black45,
      spacing: 0.0,
    );
  }
}
