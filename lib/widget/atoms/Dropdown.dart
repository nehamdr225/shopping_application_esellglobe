// import 'package:EsellGlobe/widget/atoms/Details.dart';
// import 'package:EsellGlobe/widget/atoms/ImageHolder.dart';
import 'package:flutter/material.dart';

// import 'package:provider/provider.dart';
//import '../store/ProductModel.dart';
class DropDown extends StatefulWidget {
  final List cap;
  final List src;
  DropDown({Key key, this.cap, this.src}) : super(key: key);
  _DropDownState createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    String dropdownValue = widget.cap[0];
    return Container(
      alignment: Alignment.topCenter,
      width: screenWidth*0.90,
      child: DropdownButton<String>(
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        value: dropdownValue,
        hint: Text('Select a category'),
        items: widget.cap.map<DropdownMenuItem<String>>((value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}