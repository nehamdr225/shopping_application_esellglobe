import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/DataContainer.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/widget/molecules/MakeLine.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class OrdetrackPage extends StatelessWidget {
  final dotSize = 20.0;
  final double _width = 20.0;
  final double _height = 70.0;
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
      this.ordered: true,
      this.packed: false,
      this.shipped,
      this.delivered})
      : dotColor = ColorTween(
          begin: Colors.grey[300],
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
    final user = Provider.of<UserModel>(context);
    //Animation<double> animation = listenable;
    return Scaffold(
        // backgroundColor: Colors.grey[300],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: FAppBar(
            title: 'Orders & Details',
          ),
        ),
        body: AnimatedBuilder(
          animation: controller,
          builder: (BuildContext context, Widget child) => ListView(
            children: [
              SizedBox(
                height: 20.0,
              ),
              Row(
                //ONE
                children: <Widget>[
                  CustomPaint(
                    size: Size(_width, _height),
                    painter: MakeLine(
                        color: ordered == true
                            ? dotColor.value
                            : Colors.grey[300]),
                  ),
                  SizedBox(width: 20.0),
                  DataContainer(
                    data: 'Ordered and Approved',
                    style: ordered == true ? textStyle.value : begin,
                  ),
                ],
              ),
              Row(
                //TWO
                children: <Widget>[
                  CustomPaint(
                    size: Size(_width, _height),
                    painter: MakeLine(
                        color:
                            packed == true ? dotColor.value : Colors.grey[300]),
                  ),
                  SizedBox(width: 20.0),
                  DataContainer(
                    data: 'Packed',
                    style: packed == true ? textStyle.value : begin,
                  ),
                ],
              ),
              Row(
                //THREE
                children: <Widget>[
                  CustomPaint(
                    size: Size(_width, _height),
                    painter: MakeLine(
                        color: shipped == true
                            ? dotColor.value
                            : Colors.grey[300]),
                    //child: Container(),
                  ),
                  SizedBox(width: 20.0),
                  DataContainer(
                    data: 'Shipped',
                    style: shipped == true ? textStyle.value : begin,
                  ),
                ],
              ),
              Row(
                //FOUR
                children: <Widget>[
                  CustomPaint(
                    size: Size(_width, _height),
                    painter: MakeLine(
                        color: delivered == true
                            ? dotColor.value
                            : Colors.grey[300]),
                    //child: Container(),
                  ),
                  SizedBox(width: 20.0),
                  DataContainer(
                    data: 'Delivered',
                    style: delivered == true ? textStyle.value : begin,
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
