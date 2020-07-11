import 'package:esell/widget/atoms/DataContainer.dart';
import 'package:esell/widget/molecules/MakeLine.dart';
import 'package:flutter/material.dart';
import 'package:esell/state/state.dart';
// import 'package:provider/provider.dart';
// import 'package:esell/state/state.dart';

class OrderLines extends StatelessWidget {
  final products;
  final dotSize = 25.0;
  final double _width = 50.0;
  final double _height = 80.0;
  final AnimationController controller;
  final Animation<Color> dotColor;
  final Animation<TextStyle> textStyle;
  final bool ordered;
  final bool packed;
  final bool shipped;
  final bool delivered;

  OrderLines(
      {Key key,
      this.controller,
      this.ordered: true,
      this.packed: false,
      this.shipped,
      this.products,
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
    //final productModel = Provider.of<ProductModel>(context);
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.white,
            title: Image.asset('images/logo/logoonly1.png'),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              color: primaryDark,
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        body: ListView(
          children: <Widget>[
            Container(
              height: 180.0,
              width: width,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.grey[200],
                  width: 1.5,
                ),
              ),
              child: Text(
                'Arriving \n5 January - 10 January',
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(fontSize: 24.0),
              ),
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) => Column(
                children: [
                  SizedBox(
                    height: 40.0,
                  ),
                  Container(
                    //ONE
                    width: width,
                    height: 100.0,
                    child: Row(
                      children: <Widget>[
                        CustomPaint(
                          size: Size(_width, _height),
                          painter: MakeLine(
                              color: ordered == true
                                  ? dotColor.value
                                  : Colors.grey[300]),
                        ),
                        SizedBox(width: 20.0),
                        Column(
                          children: <Widget>[
                            DataContainer(
                              data: 'Ordered and Approved',
                              time: '2 January',
                              timeStyle: ordered == true
                                  ? textStyle.value.copyWith(fontSize: 13.0)
                                  : begin.copyWith(fontSize: 13.0),
                              style: ordered == true ? textStyle.value : begin,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DataContainer(
                              data: 'Ordered and Approved',
                              style: ordered == true
                                  ? textStyle.value.copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15.0)
                                  : begin.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.5),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    //TWO
                    width: width,
                    height: 100.0,
                    child: Row(
                      children: <Widget>[
                        CustomPaint(
                          size: Size(_width, _height),
                          painter: MakeLine(
                              color: packed == true
                                  ? dotColor.value
                                  : Colors.grey[300]),
                        ),
                        SizedBox(width: 20.0),
                        Column(
                          children: <Widget>[
                            DataContainer(
                              data: 'Packed',
                              //time: '2 January',
                              timeStyle: ordered == true
                                  ? textStyle.value.copyWith(fontSize: 13.0)
                                  : begin.copyWith(fontSize: 13.0),
                              style: packed == true ? textStyle.value : begin,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DataContainer(
                              //data: 'Packed',
                              style: packed == true
                                  ? textStyle.value.copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15.0)
                                  : begin.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.5),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    //THREE
                    width: width,
                    height: 100.0,
                    child: Row(
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
                        Column(
                          children: <Widget>[
                            DataContainer(
                              data: 'Shipped',
                              //time: '2 January',
                              timeStyle: shipped == true
                                  ? textStyle.value.copyWith(fontSize: 13.0)
                                  : begin.copyWith(fontSize: 13.0),
                              style: shipped == true ? textStyle.value : begin,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DataContainer(
                              //data: 'Shipped',
                              style: shipped == true
                                  ? textStyle.value.copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15.0)
                                  : begin.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.5),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    //FOUR
                    width: width,
                    height: 100.0,
                    child: Row(
                      children: <Widget>[
                        CustomPaint(
                          size: Size(_width, _height),
                          painter: MakeLine(
                              lastline: false,
                              color: delivered == true
                                  ? dotColor.value
                                  : Colors.grey[300]),
                          //child: Container(),
                        ),
                        SizedBox(width: 20.0),
                        Column(
                          children: <Widget>[
                            DataContainer(
                              data: 'Delivered',
                              //time: '2 January',
                              timeStyle: delivered == true
                                  ? textStyle.value.copyWith(fontSize: 13.0)
                                  : begin.copyWith(fontSize: 13.0),
                              style:
                                  delivered == true ? textStyle.value : begin,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            DataContainer(
                              //data: 'Delivered',
                              style: delivered == true
                                  ? textStyle.value.copyWith(
                                      fontWeight: FontWeight.w300,
                                      fontSize: 15.0)
                                  : begin.copyWith(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15.5),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
