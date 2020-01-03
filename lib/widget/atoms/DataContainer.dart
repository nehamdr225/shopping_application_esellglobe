import 'package:flutter/material.dart';

class DataContainer extends StatelessWidget {
  final data;
  final time;
  final height;
  final Alignment alignment;
  final TextStyle style;
  final TextStyle timeStyle;
  DataContainer({
      this.data: '',
      this.time: '',
      this.height: 108.0,
      this.alignment: Alignment.topCenter,
      this.style,
      this.timeStyle});

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: [
          Text(
            data,
            style: style,
          ),
          SizedBox(width: 10.0,),
          Text(
            time,
            style: timeStyle,
          ),
        ],
      
    );
  }
}
