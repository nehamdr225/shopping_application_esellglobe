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
  'Chartreuse': Color(0xff7fff00),
  'Aqua': Color(0xff00ffff),
  'Fuchsia': Color(0xffff00ff),
  'Maroon': Color(0xff800000),
  'Navy': Color(0xff000080),
  'Olive': Color(0xff808000),
  'Silver': Color(0xffc0c0c0),
};

class _PDColorSelectorState extends State<PDColorSelector> {
  String selectedColor;

  List<Widget> buildColorWidgets(List<String> colorNames) {
    return colorNames.map<Widget>((eachColor) {
      return Padding(
        padding: const EdgeInsets.all(5.0),
        child: InkWell(
          onTap: () {
            if (eachColor != selectedColor) {
              widget.setColor(eachColor);
              setState(() {
                selectedColor = eachColor;
              });
            }
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(14.0),
            child: Container(
              alignment: Alignment.center,
              width: 25.0,
              height: 25.0,
              color: eachColor == selectedColor ? Theme.of(context).colorScheme.primaryVariant : shadowGrey,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(7.5),
                child: Container(
                  width: 17.0,
                  height: 17.0,
                  color: COLOR_TYPES[eachColor] ?? COLOR_TYPES['Red'],
                ),
              ),
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    List colorList = widget.color.split(';');
    List<Widget> colorWidgets;
    if (colorList.length > 0)
      colorWidgets = buildColorWidgets(colorList);
    else
      colorWidgets = [Text('')];

    return Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.8,
        alignment: Alignment.centerLeft,
        child:
            // Column(
            //     mainAxisAlignment: MainAxisAlignment.start,
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children:
            //         ? [
            // Padding(
            //   padding: EdgeInsets.only(left: 14.0, top: 10.0),
            //   child: Text(
            //     "Select Color",
            //     style: Theme.of(context).textTheme.bodyText2.copyWith(
            //         fontWeight: FontWeight.w600, fontSize: 15.0),
            //     textAlign: TextAlign.left,
            //   ),
            // ),
            colorList.length > 0
                ? Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: colorWidgets,
                )
                : SizedBox.shrink()
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
        //]

        //),
        );
  }
}
