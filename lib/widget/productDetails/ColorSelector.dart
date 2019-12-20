import 'package:esell/state/src/theme.dart';
import 'package:flutter/material.dart';

class PDColorSelector extends StatefulWidget {
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

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 8.0),
      // height: 200.0,
      // width: 360.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.0))),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        color: Colors.white,
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Padding(
            padding: EdgeInsets.only(left: 15.0),
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
      ),
    );
  }
}
