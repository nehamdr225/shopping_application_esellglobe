import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/DataContainer.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/molecules/MakeLine.dart';
import 'package:flutter/material.dart';

class OrdetrackPage extends StatelessWidget {
  final dotSize = 20.0;
  final double _width = 30.0;
  final double _height = 120.0;
  final AnimationController controller;
  final Animation<Color> dotColor;
  final Animation<TextStyle> textStyle;
  final bool ordered;
  final bool packed;
  final bool shipped;
  final bool delivered;

  OrdetrackPage(
      {Key key,
      this.controller,
      this.ordered,
      this.packed,
      this.shipped,
      this.delivered})
      : dotColor = ColorTween(
          begin: barGrey,
          end: orderBar,
        ).animate(
          CurvedAnimation(
              parent: controller, curve: Curves.fastLinearToSlowEaseIn),
        ),
        textStyle = TextStyleTween(begin: begin, end: end).animate(
          CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn),
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
                height: 80.0,
                width: 100.0,
              ),
              Row(
                //ONE
                children: <Widget>[
                  Container(
                    height: _height,
                    width: _width,
                    child: CustomPaint(
                      painter: MakeLine(
                          color: ordered == true ? dotColor.value : barGrey),
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  DataContainer(
                    data: 'Ordered and Approved',
                    style: ordered == true ? textStyle.value : begin,
                  ),
                ],
              ),
              Row(
                //TWO
                children: <Widget>[
                  Container(
                    height: _height,
                    width: _width,
                    child: CustomPaint(
                      painter: MakeLine(
                          color: ordered == true ? barGrey : dotColor.value),
                    ),
                  ),
                  DataContainer(
                    data: 'Packed',
                    style: ordered == true ? textStyle.value : begin,
                  ),
                ],
              ),
              Row(
                //THREE
                children: <Widget>[
                  Container(
                    height: _height,
                    width: _width,
                    child: CustomPaint(
                      painter: MakeLine(
                          color: ordered == true ? dotColor.value : barGrey),
                      //child: Container(),
                    ),
                  ),
                  DataContainer(
                    data: 'Shipped',
                    style: ordered == true ? textStyle.value : begin,
                  ),
                ],
              ),
              Row(
                //FOUR
                children: <Widget>[
                  Container(
                    height: _height,
                    width: _width,
                    child: CustomPaint(
                      painter: MakeLine(
                          color: ordered == true ? dotColor.value : barGrey),
                      //child: Container(),
                    ),
                  ),
                  DataContainer(
                    data: 'Delivered',
                    style: ordered == true ? textStyle.value : begin,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
