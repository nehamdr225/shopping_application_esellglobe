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
    final body1 = Theme.of(context).textTheme.body1.copyWith(fontSize: 16.0);
    final product = Provider.of<ProductModel>(context).one(id);
    final property = properties(product['category']);

    TableRow oneProperty(String x) {
      var combi = x.replaceAll(' ', '');
      var first = combi.substring(0, 1).toLowerCase();
      var name = first + combi.substring(1, x.length);
      return details['$name'] != null && details['$name'].length > 0
          ? TableRow(children: [
              FText(
                text: x,
                color: Colors.grey[500],
                size: 16.0,
              ),
              FText(
                text: product['$name'],
                style: body1,
              )
            ])
          : TableRow(children: [Container(), Container()]);
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
                          style: Theme.of(context).textTheme.body1.copyWith(
                                fontWeight: FontWeight.w900,
                                fontSize: 18.0,
                              ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 6.0, left: 6.0),
                        child: Text(
                          "₹ 1800",
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
                    children: property.map<TableRow>(oneProperty).toList() +
                        [
                          details['material'] != null &&
                                  details['material'].length > 0
                              ? TableRow(children: [
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
                              : TableRow(children: [Container(), Container()]),
                          details['style'] != null &&
                                  details['style'].length > 0
                              ? TableRow(children: [
                                  FText(
                                    text: "Style",
                                    color: Colors.grey[500],
                                    size: 16.0,
                                  ),
                                  FText(
                                    text: details['style'] ?? "N/A",
                                    style: body1,
                                  ),
                                ])
                              : TableRow(children: [Container(), Container()]),
                          details['closure'] != null &&
                                  details['closure'].length > 0
                              ? TableRow(children: [
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
                              : TableRow(children: [Container(), Container()]),
                          details['warranty'] != null &&
                                  details['closure'].length > 0
                              ? TableRow(children: [
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
                              : TableRow(children: [Container(), Container()]),
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
