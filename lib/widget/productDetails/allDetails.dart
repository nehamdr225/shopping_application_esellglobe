import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Text.dart';
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

class PDAllDetails extends StatefulWidget {
  final id;
  final category;
  PDAllDetails({this.id, this.category});

  @override
  _PDAllDetailsState createState() => _PDAllDetailsState();
}

class _PDAllDetailsState extends State<PDAllDetails>
    with SingleTickerProviderStateMixin {
  ScrollController _scrollViewController;
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _scrollViewController = ScrollController();
    _tabController = new TabController(
      length: 3,
      vsync: this,
      initialIndex: 0,
    );
  }

  @override
  void dispose() {
    _scrollViewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<ProductModel>(context)
        .one(widget.id, widget.category.split(';').first);
    final imagesrc = "https://api.shop2more.com" + (product.media.front ?? '');
    final body1 =
        Theme.of(context).textTheme.bodyText2.copyWith(fontSize: 16.0);

    final property = properties(product.category);
    final size = MediaQuery.of(context).size;

    Row oneProperty(String x) {
      var combi = x.replaceAll(' ', '');
      var newName = combi.substring(0, 1).toLowerCase() + combi.substring(1);
      return product.description[newName] != null &&
              product.description[newName].length > 0
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
                  text: product.description[newName],
                  style: body1,
                  align: TextAlign.justify,
                ),
              )
            ])
          : Row(children: [Container(), Container()]);
    }

    return Scaffold(
        // appBar: PreferredSize(
        //   preferredSize: Size.fromHeight(40.0),
        //   child: BlueAppBar(
        //     onPressed: () {
        //       Navigator.of(context).pop();
        //     },
        //   ),
        // ),
        body: NestedScrollView(
      controller: _scrollViewController,
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            elevation: 1.0,
            pinned: true,
            forceElevated: innerBoxIsScrolled,
            iconTheme: IconThemeData(
              color: primaryDark,
            ),
            backgroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(120.0),
              child: Column(
                children: <Widget>[
                  Container(
                    // card
                    width: MediaQuery.of(context).size.width * 0.95,
                    height: 90.0,
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
                              text: product.name,
                              style: body1.copyWith(
                                  fontSize: 16.0, fontWeight: FontWeight.w600),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 6.0, left: 0.0),
                                  child: Text(
                                    "₹ ${product.price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18.0,
                                        ),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 6.0, left: 6.0),
                                  child: Text(
                                    "₹ 1800",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 13.0,
                                            color: Colors.grey[500],
                                            decoration:
                                                TextDecoration.lineThrough),
                                  ),
                                ),
                                Padding(
                                  padding:
                                      EdgeInsets.only(right: 6.0, left: 6.0),
                                  child: Text(
                                    "50% off",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
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
                  // Divider(),
                  TabBar(
                      indicatorColor: Theme.of(context).colorScheme.secondary,
                      isScrollable: true,
                      controller: _tabController,
                      unselectedLabelStyle: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 14.0),
                      unselectedLabelColor:
                          Theme.of(context).textTheme.bodyText2.color,
                      //unselectedWidgetColor,
                      labelColor: Colors.black,
                      labelStyle: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 15.0),
                      // indicator: BoxDecoration(),
                      tabs: 
                      <Widget>[
                        Tab(
                          text: "Details",
                        ),
                        Tab(
                          text: "Specification",
                        ),
                        Tab(
                          text: "More",
                        ),
                      ]),
                  
                ],
              ),
            ),
          )
        ];
      },
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TabBarView(
          controller: _tabController,
          children: <Widget>[
            Column(
              //tab0
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                    child: FText(
                  text:
                      product.description['details'].replaceAll('\n', '\n\n') ??
                          "N/A",
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
                          product.description['style'] != null &&
                                  product.description['style'].length > 0
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
                                        text: product.description['style'] ??
                                            "N/A",
                                        style: body1,
                                      ),
                                    ),
                                  ],
                                )
                              : Row(
                                  children: <Widget>[Container(), Container()],
                                ),
                          product.description['warranty'] != null &&
                                  product.description['closure'].length > 0
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
                                          text:
                                              product.description['warranty'] ??
                                                  "N/A",
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
                  text: product.description['care_instructions'] ?? "N/A",
                  style: body1,
                )),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
