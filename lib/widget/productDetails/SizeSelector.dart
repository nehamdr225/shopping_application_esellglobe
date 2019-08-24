import 'package:flutter/material.dart';

class PDSizeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
        height: 150.0,
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
                padding: EdgeInsets.all(8.0),
              ),
              Row(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 12.0),
                  ),
                  Text(
                    "Select Size ",
                    style: Theme.of(context).textTheme.body2,
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 160.0),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "view size chart",
                      style: Theme.of(context)
                          .textTheme
                          .caption
                          .copyWith(decoration: TextDecoration.underline),
                      textAlign: TextAlign.right,
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Row(children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black45)),
                      child: Text(
                        "S",
                        style: TextStyle(
                            fontFamily: "Ropa Sans",
                            fontSize: 32.0,
                            color: Colors.black38),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black45)),
                      child: Text(
                        "M",
                        style: TextStyle(
                            fontFamily: "Ropa Sans",
                            fontSize: 32.0,
                            color: Colors.black38),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black45)),
                      child: Text(
                        "L",
                        style: TextStyle(
                            fontFamily: "Ropa Sans",
                            fontSize: 32.0,
                            color: Colors.black38),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(5.0),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 40.0,
                      width: 40.0,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.black45)),
                      child: Text(
                        "XL",
                        style: TextStyle(
                            fontFamily: "Ropa Sans",
                            fontSize: 32.0,
                            color: Colors.black38),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ]),
              )
            ],
          ),
        ));
  }
}
