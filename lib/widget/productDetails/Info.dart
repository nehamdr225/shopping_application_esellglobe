import 'package:esell/widget/atoms/Text.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/atoms/StarRating.dart';

class PDInfo extends StatelessWidget {
  final String name, details, color, price;
  PDInfo({this.name, this.price, this.details, this.color: "N/A"});

  @override
  Widget build(BuildContext context) {
    final caption = Theme.of(context).textTheme.caption;
    final title = Theme.of(context).textTheme.body2;
    
    return Container(
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0))),
        
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(left: 5.0)),
                  Container(
                    width: 170.0,
                    child: FText(text: name)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    //mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FText(
                        text: 'Rate this item',
                        style: caption,
                      ),
                      PDStarRating(rating: 4.2),
                    ],
                  )
                ],
              ),
              Divider(color: Colors.black26),
              Padding(
                padding: EdgeInsets.all(15.0),
                child: Container(
                  child: Table(children: [
                    TableRow(children: [
                      FText(text: "Price", style: title),
                      FText(text: "Rs. $price\n  ", style: title),
                    ]),
                    TableRow(children: [
                      FText(text: "Color", style: title),
                      FText(text: "$color \n ", style: title),
                    ]),
                    TableRow(
                      children: [
                        FText(text: "Description", style: title),
                        FText(
                          text: details,
                          style: title,
                        ),
                      ],
                    ),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
