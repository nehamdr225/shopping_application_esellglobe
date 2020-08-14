import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PDStarRating extends StatelessWidget {
  final double rating;
  final double size;
  final double spacing;
  final bool allowHalfRating;
  PDStarRating({this.rating, this.size:28.0, this.spacing:0.0, this.allowHalfRating});
  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
      allowHalfRating: allowHalfRating,
      onRatingChanged: (v) {},
      starCount: 5,
      rating: rating,
      size: size,
      color: Theme.of(context).buttonColor, // secondary
      borderColor: Theme.of(context).buttonColor,
      spacing: spacing,
    );
  }
}
