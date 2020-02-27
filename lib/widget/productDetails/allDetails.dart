import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Text.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:esell/widget/productDetails/TabView.dart';
import 'package:flutter/material.dart';

class PDAllDetails extends StatelessWidget {
  final details;
  final name;
  final price;
  final image;
  PDAllDetails({this.details, this.name, this.price, this.image});
  @override
  Widget build(BuildContext context) {
    final imagesrc = "https://api.shop2more.com" + image;
    final body1 = Theme.of(context).textTheme.body1.copyWith(fontSize: 16.0);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: BlueAppBar(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: ListView(children: <Widget>[
        Container(
          // card
          width: MediaQuery.of(context).size.width * 0.95,
          height: 100.0,
          child: Card(
            child: ListTile(
              leading: Image.network(
                imagesrc,
                fit: BoxFit.contain,
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  FText(
                    text: '$name',
                    style: body1.copyWith(
                        fontSize: 16.0, fontWeight: FontWeight.w600),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        "images/icons/rupee.png",
                        height: 14.0,
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 6.0, left: 6.0),
                        child: Text(
                          "$price",
                          style: Theme.of(context).textTheme.body1.copyWith(
                                fontWeight: FontWeight.w900,
                                fontSize: 18.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 6.0, left: 6.0),
                        child: Text(
                          "\$ 1800",
                          style: Theme.of(context).textTheme.body1.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 13.0,
                              color: Colors.grey[500],
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 6.0, left: 6.0),
                        child: Text(
                          "50% off",
                          style: Theme.of(context).textTheme.body1.copyWith(
                                fontWeight: FontWeight.w600,
                                color: Colors.green,
                                fontSize: 15.0,
                              ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
        TabView(
          tabs: ["Details", "Specifications", "More"],
          tabItems: <Widget>[
            Column(
              //tab0
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 8.0),
                    child: FText(
                      text: "Details",
                      color: textColor,
                      size: 16.0,
                      fontWeight: FontWeight.w600,
                    )),
                Container(
                    child: FText(
                  text: details['details'] ?? "N/A",
                  style: body1,
                )),
              ],
            ),
            Column(
              //tab1
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 8.0),
                    child: FText(
                      text: "Product Details",
                      color: textColor,
                      size: 16.0,
                      fontWeight: FontWeight.w600,
                    )),
                Container(
                  child: Table(
                    children: [
                      TableRow(children: [
                        FText(
                          text: "Material",
                          color: Colors.grey[500],
                          size: 16.0,
                        ),
                        FText(
                          text: details['material'] ?? "N/A",
                          style: body1,
                        ),
                      ])
                    ],
                  ),
                ),
                details['closure'] != null && details['closure'].length > 0
                    ? Container(
                        child: Table(
                          children: [
                            TableRow(children: [
                              FText(
                                text: "Closure",
                                color: Colors.grey[500],
                                size: 16.0,
                              ),
                              FText(
                                text: details['closure'],
                                style: body1,
                              )
                            ])
                          ],
                        ),
                      )
                    : Text(''),
                Container(
                  child: Table(
                    children: [
                      TableRow(children: [
                        FText(
                          text: "Warranty",
                          color: Colors.grey[500],
                          size: 16.0,
                        ),
                        FText(
                          text: details['warranty'] ?? "N/A",
                          style: body1,
                        )
                      ])
                    ],
                  ),
                ),
              ],
            ),
            Column(
              //tab2
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    padding: EdgeInsets.only(top: 8.0),
                    child: FText(
                      text: "Care Instructions",
                      color: textColor,
                      size: 16.0,
                      fontWeight: FontWeight.w600,
                    )),
                Container(
                    child: FText(
                  text: details['care_instructions'] ?? "N/A",
                  style: body1,
                )),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}
