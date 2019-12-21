import 'package:esell/state/src/theme.dart';
import 'package:esell/widget/productDetails/ColorSelector.dart';
import 'package:flutter/material.dart';

class PDSizeSelector extends StatefulWidget {
  final Function setSize, setColor;
  final colors, sizes;
  PDSizeSelector({this.setColor, this.setSize, this.sizes, this.colors});

  @override
  _PDSizeSelectorState createState() => _PDSizeSelectorState();
}

class _PDSizeSelectorState extends State<PDSizeSelector> {
  String active = "S";

  buildSizeWidgets(size) {
    List<Widget> widgets = [];
    for (int i = size[0]; i <= size[1]; i++) {
      widgets.add(
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: InkWell(
              onTap: () {
                widget.setSize(i.toString());
                setState(() {
                  active = i.toString();
                });
              },
              child: Container(
                height: 37.0,
                width: 34.0,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: active == i.toString() ? primary : Colors.transparent,
                    shape: BoxShape.rectangle,
                    border: Border.all(color: Colors.black87)),
                child: Text(
                  i.toString(),
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
    List sizeList = widget.sizes['uk'].split('-');
    final mappedList = sizeList.map<int>((each) {
      return int.parse(each);
    }).toList();
    final widgets = buildSizeWidgets(mappedList);
    print(widgets);
    return Container(
        padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 8.0),
        width: screenWidth * 0.95,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.0))),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(2.0),
            ),
            PDColorSelector(color: widget.colors),
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
                Text(
                  "UK",
                  style: Theme.of(context).textTheme.body2,
                  textAlign: TextAlign.start,
                ),
                Padding(
                  padding: EdgeInsets.only(right: 145.0),
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
            
            Row(mainAxisAlignment: MainAxisAlignment.center, children: widgets)
          ],
        ));
  }
}
