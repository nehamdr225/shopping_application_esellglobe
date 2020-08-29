import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: BlueAppBar(
            title: "About",
          )),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        padding: EdgeInsets.all(8.0),
        alignment: Alignment.center,
        color: Theme.of(context).colorScheme.background,
        width: screenWidth * 0.90,
        height: 400.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'About',
              textAlign: TextAlign.start,
              style: Theme.of(context).textTheme.headline1,
            ),
            Text(
              'Shop 2 More is a shopping app made just for you!',
              textAlign: TextAlign.start,
              style:
                  Theme.of(context).textTheme.caption.copyWith(fontSize: 16.0),
            )
          ],
        ),
      ),
    ));
  }
}
