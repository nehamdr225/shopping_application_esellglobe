import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/DataContainer.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';

class OrdetrackPage extends StatelessWidget {
  final dotSize = 20.0;
  final double _width = 30.0;
  final double _height = 107.0;
  final AnimationController controller;
  final Animation<Color> dotOneColor;
  final Animation<TextStyle> textOneStyle;
  final Animation<Color> dotTwoColor;
  final Animation<TextStyle> textTwoStyle;
  final Animation<Color> dotThreeColor;
  final Animation<TextStyle> textThreeStyle;
  final Animation<Color> dotFourColor;
  final Animation<TextStyle> textFourStyle;
  // final Color color;
  final bool order;

  OrdetrackPage(
      {Key key, this.controller, this.order:true}) //this.order: true, this.color})
      : dotOneColor = ColorTween(
          begin: barGrey,
          end: orderBar,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.200,
              curve: Curves.linear,
            ),
          ),
        ),
        textOneStyle = TextStyleTween(
          begin: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 12),
          end: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 12),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.000,
              0.200,
              curve: Curves.linear,
            ),
          ),
        ),
        dotTwoColor = ColorTween(
          begin: barGrey,
          end: orderBar,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.200,
              0.400,
              curve: Curves.linear,
            ),
          ),
        ),
        textTwoStyle = TextStyleTween(
          begin: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 12),
          end: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 12),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.200,
              0.400,
              curve: Curves.linear,
            ),
          ),
        ),
        dotThreeColor = ColorTween(
          begin: barGrey,
          end: orderBar,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.400,
              0.600,
              curve: Curves.linear,
            ),
          ),
        ),
        textThreeStyle = TextStyleTween(
          begin: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 12),
          end: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 12),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.400,
              0.600,
              curve: Curves.linear,
            ),
          ),
        ),
        dotFourColor = ColorTween(
          begin: barGrey,
          end: orderBar,
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.600,
              0.800,
              curve: Curves.linear,
            ),
          ),
        ),
        textFourStyle = TextStyleTween(
          begin: TextStyle(
              fontWeight: FontWeight.w400, color: Colors.grey, fontSize: 12),
          end: TextStyle(
              fontWeight: FontWeight.w600, color: Colors.black87, fontSize: 12),
        ).animate(
          CurvedAnimation(
            parent: controller,
            curve: Interval(
              0.600,
              0.800,
              curve: Curves.linear,
            ),
          ),
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    //Animation<double> animation = listenable;
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: FAppBar(wishlist: true, cart: true),
        ),
        body: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget child) => ListView(
            children: [
              Container(
                height: 60.0,
                width: 100.0,
                //color: Colors.green,
              ),
              Row( //ONE
                children: <Widget>[
                  Container(
                    height: _height,
                    width: _width,
                    child: CustomPaint(
                      painter: MakeLine(
                        color: dotOneColor.value
                      ),
                    ),
                  ),
                  DataContainer(
                    style: textOneStyle.value,
                  ),
                ],
              ),
              Row( //TWO
                children: <Widget>[
                  Container(
                    height: _height,
                    width: _width,
                    child: CustomPaint(
                      painter: MakeLine(color: dotTwoColor.value),
                    ),
                  ),
                  DataContainer(
                    style: textTwoStyle.value,
                  ),
                ],
              ),
              Row( //THREE
                children: <Widget>[
                  Container(
                    height: _height,
                    width: _width,
                    child: CustomPaint(
                      painter: MakeLine(
                        color: dotThreeColor.value
                      ),
                      //child: Container(),
                    ),
                  ),
                  DataContainer(
                    style: textThreeStyle.value,
                  ),
                ],
              ),
              Row( //FOUR
                children: <Widget>[
                  Container(
                    height: _height,
                    width: _width,
                    child: CustomPaint(
                      painter: MakeLine(
                        color: dotFourColor.value
                      ),
                      //child: Container(),
                    ),
                  ),
                  DataContainer(
                    style: textFourStyle.value,
                  ),
                ],
              ),
              Row( //FIVE
                children: <Widget>[
                  Container(
                    height: _height,
                    width: _width,
                    child: CustomPaint(
                      painter: MakeLine(
                        color: dotFourColor.value,
                        lastline: false
                      ),
                      //child: Container(),
                    ),
                  ),
                  DataContainer(
                    style: textFourStyle.value,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}

class MakeLine extends CustomPainter {
  final color;
  final lastline;

  Paint _paint;
  MakeLine({this.color: Colors.grey, this.lastline:true}) {
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
    lastline ==true
    ?canvas.drawLine(Offset(x, 0), Offset(x, 100.0), _paint)
    :canvas.drawLine(Offset(x, 0), Offset(x, 0.0), Paint()..color = Colors.transparent);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
