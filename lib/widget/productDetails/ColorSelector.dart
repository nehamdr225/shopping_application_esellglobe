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
        height: 200.0,
        width: 360.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.0))),
        child: Card(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0)),
            color: Colors.white,
            child: DropdownButton(
              onChanged: (selectColor) {
                setState(() {
                  selectedColor = selectColor;
                });
              },
              value: selectedColor,
              hint: Text('Select a color'),
              items: _color
                  .map((value) => DropdownMenuItem(
                      child: Text(
                        value,
                        style: TextStyle(color: Colors.black54),
                      ),
                      value: value))
                  .toList(),
            )));
  }
}
