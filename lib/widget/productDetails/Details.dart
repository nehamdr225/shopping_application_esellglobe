import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Text.dart';
import 'package:esell/widget/productDetails/allDetails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PDDetails extends StatefulWidget {
  final details;
  final price;
  final id;
  PDDetails({this.details, this.price, this.id});

  @override
  _PDDetailsState createState() => _PDDetailsState();
}

class _PDDetailsState extends State<PDDetails> {
  @override
  Widget build(BuildContext context) {
    final body1 = Theme.of(context).textTheme.body1.copyWith(fontSize: 16.0);
    final product = Provider.of<ProductModel>(context).one(widget.id);
    
    Widget  trailing;
    String descriptionText;

    if (widget.details['details'].length > 150){
      descriptionText = widget.details['details'].substring(0,150);
      trailing = InkWell(
        child: Text('more', style: TextStyle(color: primaryDark)),
        onTap: (){
          setState(() {
            descriptionText = widget.details['details'];
            trailing = null;
          });
        },
      );
    }
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        color: Colors.white,
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                child: Table(
                  children: [
                    TableRow(children: [
                      FText(
                        text: "Material",
                        color: Colors.grey[500],
                        size: 16.0,
                      ),
                      FText(
                        text: widget.details['material'] ?? "N/A",
                        style: body1,
                      ),
                    ])
                  ],
                ),
              ),
              widget.details['closure'] != null && widget.details['closure'].length > 0
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
                              text: widget.details['closure'],
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
                        text: widget.details['warranty'] ?? "N/A",
                        style: body1,
                      )
                    ])
                  ],
                ),
              ),
              Container(
                  child: FText(
                text: "Details",
                color: textColor,
                size: 15.0,
                fontWeight: FontWeight.w600,
              )),
              // Container(
              //     child: FText(
              //   text: widget.details['details'] ?? "N/A",
              //   style: body1,
              // )),
              Container(
                child: Stack(
                  children: <Widget>[
                     FText(
                text: descriptionText,
                color: textColor,
                size: 15.0,
                fontWeight: FontWeight.w600,
              ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child:  trailing != null 
                    ? trailing
                    : Text('')
                    )
                   
                  
                  ],
                )
                    
                    
                
              ),

              Padding(
                padding: EdgeInsets.only(left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "All Details",
                      style: Theme.of(context).textTheme.body1.copyWith(
                          fontSize: 15.0, fontWeight: FontWeight.w600),
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
