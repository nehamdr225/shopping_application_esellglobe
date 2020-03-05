import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Text.dart';
import 'package:esell/widget/productDetails/allDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PDDetails extends StatefulWidget {
  final details;
  final price;
  final id;
  PDDetails({
    this.details,
    this.price,
    this.id,
  });

  @override
  _PDDetailsState createState() => _PDDetailsState();
}

class _PDDetailsState extends State<PDDetails> {
  bool more = false;
  @override
  Widget build(BuildContext context) {
    final body1 = Theme.of(context).textTheme.body1.copyWith(fontSize: 16.0);
    final product = Provider.of<ProductModel>(context).one(widget.id);
    final size = MediaQuery.of(context).size;
    //final property = Provider.of<PropertiesModel>(context).properties(category);
    //final properties = product['description']['TTopDescriptionData'];
    //print(properties);
//////////////////////////on press more ////////////////////////////////
    //String descriptionText, trailingText;

    // if (widget.details['details'] != null &&
    //     widget.details['details'].length > 150) {
    //   descriptionText = widget.details['details'].substring(0, 150);
    //   trailingText = widget.details['details']
    //       .substring(150, widget.details['details'].length);
    // } else if (widget.details['details'] != null &&
    //     widget.details['details'].length < 150) {
    //   descriptionText = widget.details['details'];
    //   trailingText = "";
    // } else {
    //   descriptionText = " ";
    //   trailingText = "";
    // }
///////////////////////////////////////////////////////////////////////////////

    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        color: Colors.white,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          Padding(
            padding: EdgeInsets.all(8.0),
          ),
          Container(
              child: FText(
            text: "Product Details",
            color: textColor,
            size: 16.0,
            fontWeight: FontWeight.w600,
          )),
          Container(
            child: widget.details != null
                ? Column(
                    children: [
                      widget.details['material'] != null &&
                              widget.details['material'].length > 0
                          ? Row(
                              children: <Widget>[
                                Container(
                                  width: size.width * 0.28,
                                  child: FText(
                                    text: "Material",
                                    color: Colors.grey[500],
                                    size: 16.0,
                                  ),
                                ),
                                Container(
                                    width: size.width * 0.72,
                                    child: FText(
                                      text: widget.details['material'] ?? "N/A",
                                      style: body1,
                                    )),
                              ],
                            )
                          : Row(
                              children: <Widget>[Container(), Container()],
                            ),
                      widget.details['warranty'] != null &&
                              widget.details['closure'].length > 0
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
                                      text: widget.details['warranty'] ?? "N/A",
                                      style: body1,
                                    ))
                              ],
                            )
                          : Row(
                              children: <Widget>[Container(), Container()],
                            ),
                      widget.details['style'] != null &&
                              widget.details['style'].length > 0
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
                                    text: widget.details['style'] ?? "N/A",
                                    style: body1,
                                  ),
                                ),
                              ],
                            )
                          : Row(
                              children: <Widget>[Container(), Container()],
                            ),
                    ],
                  )
                : Text(''),
          ),
          Divider(),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  "View More",
                  style: Theme.of(context)
                      .textTheme
                      .body1
                      .copyWith(fontSize: 14.0, fontWeight: FontWeight.w600),
                  textAlign: TextAlign.left,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: IconButton(
                    iconSize: 12.0,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[500],
                      size: 16.0,
                    ),
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => PDAllDetails(
                          details: product['description'],
                          price: product['price'],
                          image: product['media']['front'],
                          name: product['name'],
                          id: widget.id,
                        ),
                      ));
                    },
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
