import 'package:esell/widget/molecules/colors.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
          elevation: 0.0,
          title: Text('About',
              style: TextStyle(fontFamily: 'Bree', color: iconthemelight)),
          iconTheme: IconThemeData(
            color: iconthemelight,
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        alignment: Alignment.center,
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
    ));
  }
}
