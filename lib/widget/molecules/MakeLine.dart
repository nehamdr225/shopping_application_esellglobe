import 'package:flutter/material.dart';

class MakeLine extends CustomPainter {
  final color;
  final lastline;

  Paint _paint;
  MakeLine({this.color: Colors.grey, this.lastline: true}) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
  }
  @override
  void paint(Canvas canvas, Size size) {
    var x = 30.0;
    final paint = Paint();
    paint.color = Colors.grey[400];
    canvas.drawCircle(Offset(x, 0), 7.0, _paint);
    lastline == true
        ? canvas.drawLine(Offset(x, 0), Offset(x, 80.0), _paint)
        : canvas.drawLine(
            Offset(x, 0), Offset(x, 0.0), Paint()..color = Colors.transparent);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
