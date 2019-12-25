import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  final data;
  final height;
  final Alignment alignment;
  final TextStyle style;
  DataContainer(
      {this.data: 'data',
      this.height: 108.0,
      this.alignment: Alignment.topCenter,
      this.style});

  @override
  Widget build(BuildContext context) {
    return Column(
      // alignment: alignment,
      // height: height,
      // width: 150.0,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          data,
          style: style,
        ),
      ],
    );
  }
}
