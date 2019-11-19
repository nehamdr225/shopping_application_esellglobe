import 'package:flutter/material.dart';

class PDFeedback extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
        height: 360.0,
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0))),
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(top: 8.0),
              ),
              Text(
                "Comments",
                style: TextStyle(
                    fontFamily: 'Victorian',
                    fontSize: 32.0,
                    color: Colors.black45),
              ),
              Divider(
                color: Colors.black26,
              ),
              Padding(
                padding: EdgeInsets.all(12.0),
                child: Container(
                  child: Table(children: [
                    TableRow(children: [
                      Text(
                        "Neha M.",
                        style: Theme.of(context).textTheme.body2,
                      ),
                      Text(
                        "It is good.\n  ",
                        style: Theme.of(context).textTheme.body2,
                      ),
                    ]),
                  ]),
                ),
              )
            ],
          ),
        ));
  }
}
