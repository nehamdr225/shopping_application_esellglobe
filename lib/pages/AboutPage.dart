import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    FlutterStatusbarcolor.setStatusBarColor(Theme.of(context).colorScheme.primaryVariant);
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Container(
          color: Colors.grey[200],
          width: screenWidth * 0.90,
          height: 400.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'About',
                style: TextStyle(
                  fontSize: 32.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Esell Globe is a shopping App made just for you!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24.0,
                  //fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
      ),
    ));
  }
}
