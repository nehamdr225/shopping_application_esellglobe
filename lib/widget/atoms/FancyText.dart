import 'package:flutter/material.dart';
import '../../pages/Home.dart';

class FancyText extends StatelessWidget {
  final String text;
  FancyText({this.text});
  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomePageApp()));
        },
        child: Text(text,
            style: TextStyle(
                fontFamily: 'Ropa Sans',
                fontSize: 20.0,
                color: Colors.deepPurple[900],  // colors lai import garera tyo icon theme bhanne rakha 
                decoration: TextDecoration.underline,
                decorationColor: Colors.deepPurple[900])),
      ),
    );
  }
}
