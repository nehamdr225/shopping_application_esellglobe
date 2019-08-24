import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PDStarRating extends StatefulWidget {
  final rating;
  PDStarRating({this.rating});
  @override
  _PDStarRatingState createState() => _PDStarRatingState();
}

class _PDStarRatingState extends State<PDStarRating> {
  double rating;
  _PDStarRatingState({this.rating});
  @override
  Widget build(BuildContext context) {
    return SmoothStarRating(
        allowHalfRating: true,
        onRatingChanged: (v) {
          if (v != rating)
            setState(() {
              rating = v;
            });
        },
        starCount: 5,
        rating: rating,
        size: 28.0,
        color: Colors.yellow,
        borderColor: Colors.black45,
        spacing: 0.0);
  }
}
