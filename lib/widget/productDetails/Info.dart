// import 'package:esell/state/src/theme.dart';
// import 'package:esell/widget/atoms/Text.dart';
import 'package:esell/state/src/product.dart';
import 'package:esell/widget/productDetails/ColorSelector.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'SizeSelector.dart';
//import 'package:esell/widget/atoms/StarRating.dart';

class PDInfo extends StatefulWidget {
  final String name, price, description, id;
  PDInfo({this.name, this.price, this.description, this.id});

  @override
  _PDInfoState createState() => _PDInfoState();
}

class _PDInfoState extends State<PDInfo> {
  String color, size;
  void setSize(String newSize) {
    if (newSize != size)
      setState(() {
        size = newSize;
      });
  }
   void setColor(String newColor) {
    if (newColor != color)
      setState(() {
        color = newColor;
      });
  }

  @override
  Widget build(BuildContext context) {
    //final caption = Theme.of(context).textTheme.caption;
    //var width = MediaQuery.of(context).size.width;
    final product = Provider.of<ProductModel>(context).one(widget.id);
    return Container(
      //width: width*0.80,
      //height: 200.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4.0))),
      child: Card(
        elevation: 0.0,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: 8.0),
              Text(
                "₹ ${widget.price}",
                style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontWeight: FontWeight.w500,
                      fontSize: 15.0,
                    ),
              ),
              SizedBox(height: 6.0),
              Text(widget.name,
                  textAlign: TextAlign.start,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontWeight: FontWeight.w900,
                      fontSize: 19.0,
                      color: Colors.grey[800])),
              PDColorSelector(color: product['colors'], setColor: setColor),
              Padding(
                padding: const EdgeInsets.only(top: 8.0, bottom:14.0),
                child: PDSizeSelector(
                  sizes: product['sizes'],
                  setSize: setSize,
                  size: size,
                  foot: product['category'].contains('Foot Wear'),
                ),
              ),
              SizedBox(height: 2.0,),
              widget.description == null
                  ? Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Text(''),
                    )
                  : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Description",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 16.0,
                                    color: Colors.grey[800])),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0, bottom: 18.0),
                          child: Text(widget.description,
                              textAlign: TextAlign.start,
                              overflow: TextOverflow.visible,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2
                                  .copyWith(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14.0,
                                      color: Colors.grey[500])),
                        ),
                      ],
                    ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 8.0, bottom: 4.0),
              //   child: Row(
              //     children: <Widget>[
              //       Text(
              //         "₹ $price",
              //         style: Theme.of(context).textTheme.bodyText2.copyWith(
              //               fontWeight: FontWeight.w900,
              //               fontSize: 17.0,
              //             ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(left: 10.0, right: 10.0),
              //         child: Text(
              //           "₹ 1800",
              //           style: Theme.of(context).textTheme.bodyText2.copyWith(
              //               fontWeight: FontWeight.w500,
              //               fontSize: 13.0,
              //               color: Colors.grey[500],
              //               decoration: TextDecoration.lineThrough),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsets.only(top: 2.0, bottom: 2.0),
              //         child: Text(
              //           "50% off",
              //           style: Theme.of(context).textTheme.bodyText2.copyWith(
              //                 fontWeight: FontWeight.w600,
              //                 color: Colors.green,
              //                 fontSize: 15.0,
              //               ),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsets.only(top: 6.0),
              //   child: Text(
              //     "Free Delivery",
              //     style: Theme.of(context).textTheme.bodyText2.copyWith(
              //           fontWeight: FontWeight.w600,
              //           color: Colors.green,
              //           fontSize: 13.0,
              //         ),
              //   ),
              // ),
            //   Padding(
            //     padding: const EdgeInsets.only(top: 6.0),
            //     child: Row(
            //       children: <Widget>[
            //         Container(
            //           width: 64.0,
            //           height: 40.0,
            //           child: Chip(
            //             backgroundColor: Colors.green,
            //             label: Row(
            //               mainAxisAlignment: MainAxisAlignment.center,
            //               crossAxisAlignment: CrossAxisAlignment.center,
            //               children: <Widget>[
            //                 Icon(
            //                   Icons.star,
            //                   size: 15.0,
            //                 ),
            //                 Padding(
            //                   padding: EdgeInsets.all(1.0),
            //                 ),
            //                 Text(
            //                   '3.9',
            //                   style: Theme.of(context)
            //                       .textTheme
            //                       .bodyText2
            //                       .copyWith(
            //                         fontWeight: FontWeight.w700,
            //                         color: Colors.white,
            //                         fontSize: 13.0,
            //                       ),
            //                 ),
            //               ],
            //             ),
            //           ),
            //         ),
            //         Padding(
            //           padding: const EdgeInsets.all(8.0),
            //           child: Text(
            //             '15 ratings and 1 review',
            //             style: Theme.of(context).textTheme.bodyText2.copyWith(
            //                   fontWeight: FontWeight.w700,
            //                   color: Colors.grey[500],
            //                   fontSize: 13.0,
            //                 ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   )
             ],
          ),
        ),
      ),
    );
  }
}
