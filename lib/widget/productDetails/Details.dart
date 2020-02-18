import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/Text.dart';
import 'package:flutter/material.dart';

class PDDetails extends StatelessWidget {
  final details;
  final price;
  PDDetails({this.details, this.price});
  @override
  Widget build(BuildContext context) {
    final body1 = Theme.of(context).textTheme.body1.copyWith(fontSize: 16.0);
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
                        text: details['material'] ?? "N/A",
                        style: body1,
                      ),
                    ])
                  ],
                ),
              ),
              Container(
                child: Table(
                  children: [
                    TableRow(children: [
                      FText(
                        text: "Closure",
                        color: Colors.grey[500],
                        size: 16.0,
                      ),
                      FText(
                        text: details['closure'] ?? "N/A",
                        style: body1,
                      )
                    ])
                  ],
                ),
              ),
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
              // Container(
              //     child: FText(
              //   text: "Available Colors",
              //   color: Theme.of(context).colorScheme.primaryVariant,
              //   size: 16.0,
              // )),
              // Container(
              //     child: FText(
              //   text: colors ?? "N/A",
              //   style: body1,
              // )),
              // Container(
              //     child: FText(
              //   text: "Sizes",
              //   color: Theme.of(context).colorScheme.primaryVariant,
              //   size: 16.0,
              // )),
              // Container(
              //     child: FText(
              //   text: 'EU:  ${sizes['eu']}\nUK:  ${sizes['uk']}',
              //   style: body1,
              // )),
              // Padding(
              //   padding: EdgeInsets.all(8.0),
              // ),
            ]),
      ),
    );
  }
}
