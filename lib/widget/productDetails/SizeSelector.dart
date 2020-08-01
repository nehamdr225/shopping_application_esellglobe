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
            width: 66.0,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                color:
                    widget.size == sizeList[i] ? primaryDark : Colors.transparent, 
                shape: BoxShape.rectangle,
                border: Border.all(color: Colors.grey[200])),
            child: Text(
              sizeList[i],
              style: TextStyle(
                  fontFamily: "Helvetica",
                  fontSize: 15.0,
                  fontWeight: FontWeight.w400,
                  color:  widget.size == sizeList[i] ? Colors.white: Colors.black87),
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
      alignment: Alignment.centerLeft,
        width: screenWidth,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.0))),
        child: Padding(
          padding: const EdgeInsets.only(top: 2.0),
          child: Wrap(
            direction: Axis.horizontal,
            children: widgets,

            // mainAxisAlignment: MainAxisAlignment.center,
            // children: widgets
          ),
        ));
  }
}
