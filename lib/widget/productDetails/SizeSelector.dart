import 'package:flutter/material.dart';

class PDSizeSelector extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 8.0),
        height: 150.0,
        width: 360.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.0))),
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          color: Colors.white,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(2.0),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 0.0, top: 0.0),
                  ),
                  Text(
                    "Select Size ",
                    style: Theme.of(context).textTheme.body2,
                    textAlign: TextAlign.left,
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 180.0),
                  ),
                  IconButton(
                    icon: Icon(Icons.more_vert),
                    onPressed: (){},
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(18.0),
                child: Row(
                  children: [

                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 37.0,
                      width: 34.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black87)),
                      child: Text(
                        "S",
                        style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: 15.0,
                            color: Colors.black87),
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
                      height: 37.0,
                      width: 34.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black87)),
                      child: Text(
                        "M",
                        style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: 15.0,
                            color: Colors.black87),
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
                      height: 37.0,
                      width: 34.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black87)),
                      child: Text(
                        "L",
                        style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: 15.0,
                            color: Colors.black87),
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
                      height: 37.0,
                      width: 34.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          border: Border.all(color: Colors.black87)),
                      child: Text(
                        "XL",
                        style: TextStyle(
                            fontFamily: "Helvetica",
                            fontSize: 15.0,
                            color: Colors.black87),
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
