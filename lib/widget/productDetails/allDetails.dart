
import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Text.dart';
import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:flutter/material.dart';

class PDAllDetails extends StatelessWidget {
  final details;
  final price;
  PDAllDetails({this.details, this.price});
  @override
  Widget build(BuildContext context) {
    final body1 = Theme.of(context).textTheme.body1.copyWith(fontSize: 16.0);
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: BlueAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 5.0),
        child: Container(
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
                Container(
                    child: FText(
                  text: "Details",
                  color: textColor,
                  size: 15.0,
                  fontWeight: FontWeight.w600,
                )),
                Container(
                    child: FText(
                  text: details['details'] ?? "N/A",
                  style: body1,
                )),
                // Container(
                //     child: FText(
                //       text: details['details'].length> 200 
                //       ?  
                //       : ,
                //   style: body1,
                // )),
                Container(
                    child: FText(
                  text: "Care Instructions",
                  color: textColor,
                  size: 15.0,
                  fontWeight: FontWeight.w600,
                )),
                Container(
                    child: FText(
                  text: details['care_instructions'] ?? "N/A",
                  style: body1,
                )),
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
                          
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}

