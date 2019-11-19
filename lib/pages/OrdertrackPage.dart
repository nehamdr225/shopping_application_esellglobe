//import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';

class OrdetrackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FAppBar(wishlist: true, cart: true),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            color: Colors.white,
            height: 200.0,
            width: 50.0,
            child: CustomPaint(
              painter: MakeLine(),
              child: Container(
                child: Text('hello'),
                //height: 700.0,
                // child: Column(
                //   children: <Widget>[
                //     Text('Order'),
                //   ],
                // ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            height: 200.0,
            width: 50.0,
            child: CustomPaint(
              painter: MakeLine(),
              child: Container(),
            ),
          ),
          Container(
            color: Colors.white,
            height: 100.0,
            width: 50.0,
            child: CustomPaint(
              painter: MakeLine(),
              child: Container(
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MakeLine extends CustomPainter {
  Paint _paint;
  MakeLine() {
    _paint = Paint()
      ..color = Colors.grey[400]
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
  }
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint();
    paint.color = Colors.grey[400];
    //var center = Offset(size.width / 2, size.height / 2);
    //canvas.drawCircle(Offset(20.0, 80.0), 7.0, paint);
    canvas.drawLine(Offset(20.0, 80.0), Offset(20.0, 180.0), _paint);
    canvas.drawCircle(Offset(20.0, 180.0), 7.0, paint);
    // canvas.drawLine(Offset(20.0, 180.0), Offset(20.0, 280.0), _paint);
    // canvas.drawCircle(Offset(20.0, 280.0), 7.0, paint);
    // canvas.drawLine(Offset(20.0, 280.0), Offset(20.0, 380.0), _paint);
    // canvas.drawCircle(Offset(20.0, 380.0), 7.0, paint);
    // canvas.drawLine(Offset(20.0, 380.0), Offset(20.0, 480.0), _paint);
    // canvas.drawCircle(Offset(20.0, 480.0), 7.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate){
    return true;
  }
}
