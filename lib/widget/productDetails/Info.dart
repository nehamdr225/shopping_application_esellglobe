import 'package:esell/widget/productDetails/AllDetails.dart';
import 'package:esell/widget/productDetails/BoughtTogether.dart';
import 'package:esell/widget/productDetails/ColorSelector.dart';
import 'package:esell/widget/productDetails/Comments.dart';
import 'package:esell/widget/productDetails/PDratingNreview.dart';
import 'package:esell/widget/productDetails/Stars.dart';
import 'package:flutter/material.dart';
import 'SizeSelector.dart';

class PDInfo extends StatefulWidget {
  final String name,
      colors,
      sizes,
      price,
      category,
      id,
      color,
      size, 
      description;
  final relatedProd;
  final Function setSize, setColor;
  PDInfo(
      {this.category,
      this.id,
      this.color,
      this.size,
      this.setSize,
      this.setColor,
      this.colors,
      this.description,
      this.name,
      this.sizes,
      this.price, this.relatedProd});

  @override
  _PDInfoState createState() => _PDInfoState();
}

class _PDInfoState extends State<PDInfo> {
  @override
  Widget build(BuildContext context) {
    
    return Card(
      elevation: 0.0,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(height: 8.0),
                      Text("₹ ${widget.price}",
                          style: Theme.of(context).textTheme.headline3),
                      SizedBox(height: 6.0),
                      Text(widget.name,
                          textAlign: TextAlign.start,
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.headline1.copyWith(
                                fontSize: 18.0,
                              )),
                    ]),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Stars(
                        color: Theme.of(context).colorScheme.secondary,
                      ),
                      Text(
                        "55 reviews",
                        style: Theme.of(context).textTheme.caption,
                      )
                    ])
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: PDColorSelector(
                  color: widget.colors, setColor: widget.setColor),
            ),
            if (!widget.category.contains('Sunglasses') &&
                !widget.category.contains('Watches') && !widget.category.contains("Bags & Backpacks"))
              Padding(
                padding: const EdgeInsets.only(top: 0.0, bottom: 16.0),
                child: PDSizeSelector(
                  sizes: widget.sizes,
                  setSize: widget.setSize,
                  size: widget.size,
                  foot: widget.category.contains('Foot Wear'),
                ),
              ),
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
                          style: Theme.of(context).textTheme.headline3),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Text(widget.description ?? '',
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.visible,
                            style: Theme.of(context).textTheme.caption),
                        // .copyWith(
                        //     fontWeight: FontWeight.w500,
                        //     fontSize: 14.0,
                        //     color: Colors.grey[500])),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => AllDetails(
                              id: widget.id,
                              category: widget.category,
                            ),
                          ));
                        },
                        child: Text("View More...",
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.visible,
                            style: Theme.of(context).textTheme.caption.copyWith(
                                  color: Color(0xff3E91CC),
                                )),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: PDratingNreview(),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.0),
                        child: PDcomments(),
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 16.0),
                        child: PDBoughtTogether(
                          relevantProds: widget.relatedProd,
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }
}
