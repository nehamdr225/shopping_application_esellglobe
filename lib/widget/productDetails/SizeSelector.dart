import 'package:esell/state/src/theme.dart';
import 'package:flutter/material.dart';

class PDSizeSelector extends StatefulWidget {
  final Function setSize, setColor;
  PDSizeSelector({this.setColor, this.setSize});

  @override
  _PDSizeSelectorState createState() => _PDSizeSelectorState();
}

class _PDSizeSelectorState extends State<PDSizeSelector> {
  String active = "S";

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 8.0),
        height: 150.0,
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.0))),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
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
                    icon: Icon(
                      Icons.more_vert,
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(18.0),
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  InkWell(
                    onTap: () {
                      widget.setSize('S');
                      setState(() {
                        active = 'S';
                      });
                    },
                    child: Container(
                      height: 37.0,
                      width: 34.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: active == "S" ? primary : Colors.transparent,
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
                    onTap: () {
                      widget.setSize('M');
                      setState(() {
                        active = 'M';
                      });
                    },
                    child: Container(
                      height: 37.0,
                      width: 34.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: active == "M" ? primary : Colors.transparent,
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
                    onTap: () {
                      widget.setSize('L');
                      setState(() {
                        active = 'L';
                      });
                    },
                    child: Container(
                      height: 37.0,
                      width: 34.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: active == "L" ? primary : Colors.transparent,
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
                    onTap: () {
                      widget.setSize('XL');
                      setState(() {
                        active = 'XL';
                      });
                    },
                    child: Container(
                      height: 37.0,
                      width: 34.0,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: active == "XL" ? primary : Colors.transparent,
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
