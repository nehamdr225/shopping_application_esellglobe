import 'package:flutter/material.dart';

class PDColorSelector extends StatefulWidget {
  @override
  _PDColorSelectorState createState() => _PDColorSelectorState();
}

class _PDColorSelectorState extends State<PDColorSelector> {
  var selectedColor;
  List<String> _color= <String>[
    'Black',
    'White',
    'Blue',
    'Red',
    'Yellow',
  ];
  
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      onChanged: (selectColor) {
        setState(() {
          selectedColor = selectColor;
        });
      },
      value: selectedColor,
      hint: Text('Select your blood type'),
      items: _color
          .map((value) => DropdownMenuItem(
              child: Text(
                value,
                style: TextStyle(color: Colors.grey),
              ),
              value: value))
          .toList(),
    );
  }
}
