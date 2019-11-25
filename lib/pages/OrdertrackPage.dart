import 'package:esell/widget/atoms/DataContainer.dart';
import 'package:flutter/material.dart';

class OrdetrackPage extends AnimatedWidget {
  final double _width = 30.0;
  final double _height = 107.0;
  final Color color;
  final bool order;
  OrdetrackPage({AnimationController controller, this.order: true, this.color})
      : super(
            listenable: Tween<double>(begin: 0, end: 200).animate(controller));
  @override
  Widget build(BuildContext context) {
    Animation<double> animation = listenable;
    return ListView(
      children: [
        Container(
          height: 60.0,
          width: 100.0,
          //color: Colors.green,
        ),
        // Center(  // sample square
        //   child: Container(
        //     height: animation.value,
        //     width: animation.value,
        //     color: Colors.red,
        //   ),
        // ),
        
        Row(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 3),
              curve: Curves.fastOutSlowIn,
              height: _height,
              width: _width,
              child: CustomPaint(
                painter: 
                order == true? MakeLine(
                  color: Colors.green
                ):
                MakeLine(),
              ),
            ),
            DataContainer(),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              height: _height,
              width: _width,
              child: CustomPaint(
                painter: MakeLine(),
                
              ),
            ),
            DataContainer(),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              height: _height,
              width: _width,
              child: CustomPaint(
                painter: MakeLine(),
                //child: Container(),
              ),
            ),
            DataContainer(),
          ],
        ),
        Row(
          children: <Widget>[
            Container(
              height: _height,
              width: _width,
              child: CustomPaint(
                painter: MakeLine(),
                //child: Container(),
              ),
            ),
            DataContainer(),
          ],
        ),
        Row(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: 3),
              height: _height,
              width: _width,
              child: CustomPaint(
                painter: MakeLine(lastline: false),
                //child: Container(),
              ),
            ),
            DataContainer(),
          ],
        ),
      ],
    );
  }
}

class MakeLine extends CustomPainter {
  final bool lastline;
  final Color color;

  Paint _paint;
  MakeLine({this.lastline: true, this.color: Colors.grey}) {
    _paint = Paint()
      ..color = color
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
  }
  @override
  void paint(Canvas canvas, Size size) {
    var x = 20.0;
    final paint = Paint();
    paint.color = Colors.grey[400];
    canvas.drawCircle(Offset(x, 0), 7.0, _paint);
    lastline == true
        ? canvas.drawLine(Offset(x, 0), Offset(x, 100.0), _paint)
        : canvas.drawLine(
            Offset(x, 0), Offset(x, 0), Paint()..color = Colors.transparent);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
