//import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';

class OrdetrackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var y = 80.0;
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: FAppBar(wishlist: true, cart: true),
      ),
      body: Table(
        children: <TableRow>[
        
        TableRow(
            children: <Widget>[
              Container(
                color: Colors.green,
                height: y+107,
                //width: 50.0,
                child: CustomPaint(
                  painter: MakeLine(y: y, z: y + 100.0),
                  child: Container(),
                ),
              ),
              Container(
                height: 200.0,
                width: 100.0,
                child: Text('data')
              ),
            ],
          ),
          // TableRow(
          //   children: <Widget>[
          //     CustomPaint(
          //       painter: MakeLine(y: y + 100.0, z: y + 200.0),
          //       child: Container(
          //         child: Text('data'),
          //       ),
          //     ),
          //     Container(
          //       width: 100.0,
          //       //child: Text('data')
          //     ),
          //   ],
          // ),
          // TableRow(
          //   children: <Widget>[
          //     CustomPaint(
          //       painter: MakeLine(y: y + 200.0, z: y + 300.0),
          //       child: Container(),
          //     ),
          //     Container(
          //       width: 100.0,
          //       child: Text('data')
          //     ),
          //   ],
          // ),
      ],),
                
      
    );
  }
}

class MakeLine extends CustomPainter {
  final double y;
  final double z;

  Paint _paint;
  MakeLine({this.y, this.z}) {
    _paint = Paint()
      ..color = Colors.grey[400]
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
  }
  @override
  void paint(Canvas canvas, Size size) {
    var x = 20.0;
    final paint = Paint();
    paint.color = Colors.grey[400];
    canvas.drawLine(Offset(x, y), Offset(x, z), _paint);
    canvas.drawCircle(Offset(x, z), 7.0, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
