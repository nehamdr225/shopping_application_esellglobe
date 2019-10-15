import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.black12,
      body:  Container(
          alignment: Alignment.bottomCenter,
          height: 200.0,
          width: screenWidth,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.pinkAccent[500],
              )
            ],
          ),
        ),
      
      
    );
  }
}