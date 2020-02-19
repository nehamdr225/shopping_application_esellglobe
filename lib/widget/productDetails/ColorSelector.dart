import 'package:esell/state/src/theme.dart';
import 'package:flutter/material.dart';

class PDColorSelector extends StatefulWidget {
  final String color;
  final Function setColor;
  PDColorSelector({this.color, this.setColor});
  @override
  _PDColorSelectorState createState() => _PDColorSelectorState();
}

//   'Violet',
// 'Magenta', 'Chartreuse', 'Aqua', 'Fuchsia',
// 'Maroon', 'Navy', 'Olive', 'Silver'
const Map<String, Color> COLOR_TYPES = {
  'Black': Colors.black,
  'Blue': Colors.blue,
  'Red': Colors.red,
  'Green': Colors.green,
  'Brown': Colors.brown,
  'White': Colors.white,
  'Yellow': Colors.yellow,
  'Orange': Colors.orange,
  'Purple': Colors.purple,
  'Teal': Colors.teal,
  'Violet': Color(0xffee82ee),
  'Megenta': Color(0xffff00ff),
  'Chartreuse' : Color(0xff7fff00),
  'Aqua' : Color(0xff00ffff),
  'Fuchsia': Color(0xffff00ff),
  'Maroon': Color(0xff800000),
  'Navy': Color(0xff000080),
  'Olive' : Color(0xff808000),
  'Silver' : Color(0xffc0c0c0),
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
                color: COLOR_TYPES[eachColor] ?? COLOR_TYPES['Red'],
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
      color: Colors.white,
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
                    color: textColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w500),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 18.0, top: 20.0, bottom: 18.0),
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
