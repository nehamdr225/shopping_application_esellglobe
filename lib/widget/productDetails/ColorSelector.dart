import 'package:esell/state/src/theme.dart';
import 'package:flutter/material.dart';

class PDColorSelector extends StatefulWidget {
  final color ;
  PDColorSelector({this.color});
  @override
  _PDColorSelectorState createState() => _PDColorSelectorState();
}

class _PDColorSelectorState extends State<PDColorSelector> {
  var selectedColor;
  List<String> _color = <String>[
    'Black',
    'White',
    'Blue',
    'Red',
    'Yellow',
  ];
  // buildColorWidgets(colorNames){
  //   List<Widget> colorWidgets = [];
  // }

  @override
  Widget build(BuildContext context) {
    // List colorList = widget.color.split('/n');
    // print(colorList);
    // final mappedColor = colorList.map((each){
    //   return 
    // }).toList();
    // print(mappedColor);
    // final colorWidgets = buildColorWidgets(mappedColor);

    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 8.0),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text(
            'Select a color',
            style: TextStyle(
                color: primaryDark,
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: DropdownButton(
            onChanged: (selectColor) {
              setState(() {
                selectedColor = selectColor;
              });
            },
            value: selectedColor,
            items: _color
                .map((value) => DropdownMenuItem(
                    child: Text(
                      value,
                      style: TextStyle(color: Colors.black54),
                    ),
                    value: value))
                .toList(),
          ),
        )
      ]),
    );
  }
}
