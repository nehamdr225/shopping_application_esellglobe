import 'package:esell/state/src/theme.dart';
import 'package:flutter/material.dart';

class PDColorSelector extends StatefulWidget {
  final String color;
  final Function setColor;
  PDColorSelector({this.color, this.setColor});
  @override
  _PDColorSelectorState createState() => _PDColorSelectorState();
}

const COLOR_TYPES = {
  'black': Colors.black,
  'blue': Colors.blue,
  'red': Colors.red,
  'green': Colors.green,
  'brown': Colors.brown,
  'white': Colors.white,
};

class _PDColorSelectorState extends State<PDColorSelector> {
  String selectedColor;

  List<Widget> buildColorWidgets(List<String> colorNames) {
    return colorNames.map<Widget>((eachColor) {
      return InkWell(
        onTap: () {
          if (eachColor != selectedColor) {
            widget.setColor(eachColor);
            setState(() {
              selectedColor = eachColor;
            });
          }
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10.0),
          child: Container(
            alignment: Alignment.center,
            width: 20.0,
            height: 20.0,
            color: eachColor == selectedColor ? Colors.red : Colors.white,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(7.5),
              child: Container(
                width: 14.0,
                height: 14.0,
                color: COLOR_TYPES[eachColor] ?? COLOR_TYPES['red'],
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List colorList = widget.color.split('\n');
    final List<Widget> colorWidgets = buildColorWidgets(colorList);

    return Container(
      padding: EdgeInsets.fromLTRB(0.0, 15.0, 0.0, 8.0),
      width: MediaQuery.of(context).size.width * 0.95,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 14.0),
              child: Text(
                'Select a color',
                style: TextStyle(
                    color: primaryDark,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18.0, top: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: colorWidgets,
              ),
            ),
            // Padding(
            //   padding: EdgeInsets.only(right: 15.0),
            //   child: DropdownButton(
            //     onChanged: (selectColor) {
            //       setState(() {
            //         selectedColor = selectColor;
            //       });
            //     },
            //     value: selectedColor,
            //     items: colorWidgets,
            //   ),
            // )
          ]),
    );
  }
}
