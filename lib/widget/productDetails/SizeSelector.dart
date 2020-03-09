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
  final String sizes, size;
  final bool foot;
  PDSizeSelector({this.setSize, this.sizes, this.size, this.foot = false});

  @override
  _PDSizeSelectorState createState() => _PDSizeSelectorState();
}

class _PDSizeSelectorState extends State<PDSizeSelector> {
  List<String> sizeList;

  buildSizeWidgets() {
    List<Widget> widgets = [];
    for (int i = 0; i <= sizeList.length - 1; i++) {
      widgets.add(Padding(
        padding: const EdgeInsets.all(6.0),
        child: InkWell(
          onTap: () {
            widget.setSize(sizeList[i]);
          },
          child: Container(
            height: 37.0,
            width: 34.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color:
                    widget.size == sizeList[i] ? primary : Colors.transparent,
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey[200])),
            child: Text(
              sizeList[i],
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
    if (widget.sizes.contains('-')) {
      final List<String> splitSizes = widget.sizes.split('-').toList();
      List<String> sizes = [];
      final int increment = widget.foot ? 1 : 2;
      // print('$increment $splitSizes');
      for (int i = int.parse(splitSizes[0]);
          i <= int.parse(splitSizes[1]);
          i = i + increment) {
        sizes.add(i.toString());
      }
      setState(() {
        sizeList = sizes;
      });
    } else if (widget.sizes.contains(';')) {
      final List<String> splitSizes = widget.sizes.split(';').toList();
      setState(() {
        sizeList = splitSizes;
      });
    } else if (widget.sizes.length == 1) {
      final List<String> splitSizes = [widget.sizes];
      setState(() {
        sizeList = splitSizes;
      });
    }
    final widgets = buildSizeWidgets();

    return Container(
        padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 2.0),
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
                  padding: EdgeInsets.only(left: 14.0, top: 10.0),
                  child: Text(
                    "Sizes",
                    style: Theme.of(context)
                        .textTheme
                        .body1
                        .copyWith(fontWeight: FontWeight.w600, fontSize: 15.0),
                    textAlign: TextAlign.left,
                  ),
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
                          style: Theme.of(context).textTheme.body1,
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
