import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Text.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:esell/widget/productDetails/TabView.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

List<String> properties(String category) {
  if (category.contains('Top Wear')) {
    return [
      'Fabric',
      'Pattern',
      'Neck',
      'Sleeve',
      'Hooded',
      'Reversible',
      'Occasion'
    ];
  } else if (category.contains('Bottom Wear')) {
    return [
      'Fabric',
      'Faded',
      'Rise',
      'Distressed',
      'Fit',
      'Pocket Type',
      'Reversible',
      'Closure',
      'Stretchable',
      'Fly',
      'Occasion'
    ];
  } else if (category.contains('Foot Wear')) {
    return [
      'Inner Material',
      'Sole Material',
      'Closure',
      'Occasion',
      'Pattern',
      'Tip Shape'
    ];
  } else if (category.contains('Bags')) {
    return [
      'Material',
      'Occasion',
      'No Of Compartments',
      'No Of Pockets',
      'Width',
      'Height',
      'Closure',
      'Size'
    ];
  } else if (category.contains('Bottom Wear')) {
    return [
      'Fabric',
      'Faded',
      'Rise',
      'Distressed',
      'Fit',
      'Pocket Type',
      'Reversible',
      'Closure',
      'Stretchable',
      'Fly',
      'Occasion'
    ];
  } else if (category.contains('Watches')) {
    return [
      'Occasion',
      'Display',
      'Watch Type',
      'Dial Color',
      'Strap Color',
      'Strap Material',
      'Strap Type',
      'Strap Design',
      'Case Material',
      'Water Resistant',
      'Shock Resistant',
      'Mechanism',
      'Diameter',
      'Dual Time',
      'World Time',
      'Novelty Features',
      'Power Source',
      'Light',
      'GPS',
      'Tour Billion',
      'Clasp Type',
      'Moon Phase'
    ];
  } else {
    return [
      'Occasion',
      'Purpose',
      'Lens Color',
      'Lens Material',
      'Feature',
      'Type',
      'Frame',
      'Frame Material',
      'Frame Color',
      'Face Type',
      'UV Protection',
      'Case Type'
    ];
  }
}

class PDAllDetails extends StatelessWidget {
  final details;
  final name;
  final id;
  final price;
  final image;
  PDAllDetails({this.details, this.name, this.price, this.image, this.id});
  @override
  Widget build(BuildContext context) {
    final imagesrc = "https://api.shop2more.com" + image;
    final body1 =
        Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 16.0);
    final product = Provider.of<ProductModel>(context).one(id);
    final property = properties(product['category']);
    final size = MediaQuery.of(context).size;

    Row oneProperty(String x) {
      var combi = x.replaceAll(' ', '');
      var newName = combi.substring(0, 1).toLowerCase() + combi.substring(1);
      return details[newName] != null && details[newName].length > 0
          ? Row(children: [
              Container(
                width: size.width * 0.28,
                child: FText(
                  text: x,
                  color: Colors.grey[500],
                  size: 16.0,
                ),
              ),
              Container(
                width: size.width * 0.72,
                child: FText(
                  text: details[newName],
                  style: body1,
                  align: TextAlign.justify,
                ),
              )
            ])
          : Row(children: [Container(), Container()]);
    }

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
                        padding: EdgeInsets.only(right: 6.0, left: 0.0),
                        child: Text(
                          "$price",
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
                                fontWeight: FontWeight.w900,
                                fontSize: 18.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 6.0, left: 6.0),
                        child: Text(
                          "₹ 1800",
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
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
                          style: Theme.of(context).textTheme.bodyText2.copyWith(
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
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: property.map<Row>(oneProperty).toList() +
                        [
                          details['style'] != null &&
                                  details['style'].length > 0
                              ? Row(
                                  children: <Widget>[
                                    Container(
                                      width: size.width * 0.28,
                                      child: FText(
                                        text: "Style",
                                        color: Colors.grey[500],
                                        size: 16.0,
                                      ),
                                    ),
                                    Container(
                                      width: size.width * 0.72,
                                      child: FText(
                                        align: TextAlign.justify,
                                        text: details['style'] ?? "N/A",
                                        style: body1,
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: <Widget>[Container(), Container()],
                                ),
                          details['warranty'] != null &&
                                  details['closure'].length > 0
                              ? Row(
                                  children: <Widget>[
                                    Container(
                                      width: size.width * 0.28,
                                      child: FText(
                                        text: "Warranty",
                                        color: Colors.grey[500],
                                        size: 16.0,
                                      ),
                                    ),
                                    Container(
                                        width: size.width * 0.72,
                                        child: FText(
                                          align: TextAlign.justify,
                                          text: details['warranty'] ?? "N/A",
                                          style: body1,
                                        ))
                                  ],
                                )
                              : Row(
                                  children: <Widget>[Container(), Container()],
                                ),
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
