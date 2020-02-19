import 'package:esell/state/src/theme.dart';
import 'package:flutter/material.dart';

/*
Now the sizes string will either be in following formats:
  1. 6-12 i.e sizes string will contain '-'
    i.e. if sizes.contains('-')
              do sizes.split('-') or similar
  2. S;M;L i.e. sizes string will contain ';'
    i.e. if sizes.contains(';')
*/

class PDSizeSelector extends StatefulWidget {
  final Function setSize;
  final String sizes;
  PDSizeSelector({this.setSize, this.sizes});

  @override
  _PDSizeSelectorState createState() => _PDSizeSelectorState();
}

class _PDSizeSelectorState extends State<PDSizeSelector> {
  String active;
  List<String> sizeList;
  String sizeType;

  buildSizeWidgets() {
    List<Widget> widgets = [];
    for (int i = (sizeType == '-' ? int.parse(sizeList[0]) : 0);
        i <= (sizeType == '-' ? int.parse(sizeList[1]) : sizeList.length - 1);
        i++) {
      widgets.add(Padding(
        padding: const EdgeInsets.all(6.0),
        child: InkWell(
          onTap: () {
            widget.setSize(sizeType == '-' ? i.toString() : sizeList[i]);
            if (sizeType == '-') {
              setState(() {
                active = i.toString();
              });
            } else {
              setState(() {
                active = sizeList[i];
              });
            }
          },
          child: Container(
            height: 37.0,
            width: 34.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color: sizeType == '-'
                    ? (active == i.toString() ? primary : Colors.transparent)
                    : (active == sizeList[i] ? primary : Colors.transparent),
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey[200])),
            child: Text(
              sizeType == '-' ? i.toString() : sizeList[i],
              style: TextStyle(
                  fontFamily: "Helvetica",
                  fontSize: 15.0,
                  color: Colors.black87),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ));
      //Text(i.toString()));
    }
    return widgets;
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    print(widget.sizes);
    print(widget.sizes.contains('-'));

    if (widget.sizes.contains('-')) {
      final List<String> splitSizes = widget.sizes.split('-').toList();
      setState(() {
        sizeList = splitSizes;
        active = splitSizes[0];
        sizeType = '-';
      });
    } else if (widget.sizes.contains(';')) {
      final List<String> splitSizes = widget.sizes.split(';').toList();
      setState(() {
        sizeList = splitSizes;
        active = splitSizes[0];
        sizeType = ';';
      });
    } else if (widget.sizes.length == 1) {
      final List<String> splitSizes = [widget.sizes];
      setState(() {
        sizeList = splitSizes;
        active = splitSizes[0];
        sizeType = ';';
      });
    }

    final widgets = buildSizeWidgets();

    return Container(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 8.0),
        width: screenWidth * 0.95,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.0))),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(2.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 14.0),
                  child: Text(
                    "Size- ",
                    style: TextStyle(
                        color: textColor,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w500),
                    textAlign: TextAlign.left,
                  ),
                ),
                Text(
                  "UK/India",
                  style: Theme.of(context)
                      .textTheme
                      .body2
                      .copyWith(color: textColor),
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 145.0),
                ),
                InkWell(
                  child: Container(
                    padding: EdgeInsets.only(right: 7.0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.linear_scale,
                          color: primaryDark,
                        ),
                        Text(
                          'Size Chart',
                          style: Theme.of(context)
                              .textTheme
                              .body1
                              .copyWith(color: primaryDark),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18.0),
              child: Wrap(
                direction: Axis.horizontal,
                children: widgets,

                // mainAxisAlignment: MainAxisAlignment.center,
                // children: widgets
              ),
            )
          ],
        ));
  }
}
