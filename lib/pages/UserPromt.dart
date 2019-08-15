import 'package:flutter/material.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

//import './widget/appbar.dart';
import './HomePage.dart';
import '../widget/colors.dart';

class UserPromptApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(Colors.white);
    return SafeArea(
        child: Container(
      color: Colors.white,
      width: 130.0,
      alignment: Alignment.center,
      child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              //1
              width: 200.0,
              height: 40.0,
              child: FloatingActionButton(
                child: const Text(
                  ' LOGO AREAS ',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Ropa Sans',
                    fontSize: 32.0,
                  ),
                ),
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
            ),
            SizedBox(
              //1
              width: 200.0,
              height: 40.0,
              child: RaisedButton(
                color: Colors.deepPurple[900],
                child: const Text(
                  'User',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Victorian',
                    fontSize: 32.0,
                  ),
                ),
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
            ),
            SizedBox(
              //2
              width: 200.0,
              height: 40.0,
              child: RaisedButton(
                color: icontheme2,
                child: const Text(
                  'Seller',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Victorian',
                    fontSize: 32.0,
                  ),
                ),
                shape: const BeveledRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(7.0)),
                ),
                onPressed: () {},
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12.0),
            ),
            Material(
              child: InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EsellglobeApp()));
                },
                child: Text('Go to store without Signing In',
                    style: TextStyle(
                        fontFamily: 'Ropa Sans',
                        fontSize: 20.0,
                        color: Colors.deepPurple[900],
                        decoration: TextDecoration.underline,
                        decorationColor: Colors.deepPurple[900])),
              ),
            ),
          ]),
    ));
  }
}
