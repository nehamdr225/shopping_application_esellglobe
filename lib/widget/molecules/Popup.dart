import 'package:flutter/material.dart';

class Popup extends StatelessWidget {
   _showBottomSheet(context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            color: Colors.white,
            height: 300.0,
            child: Column(
              children: <Widget>[
                Container(
                  height: 0.0,
                  child: ListTile(
                    trailing: IconButton(
                      color: Colors.deepPurple[900],
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Container(
                  height: 90.0,
                  child: ListTile(
                    title: Center(child: Image.asset('images/logo/logoonly1.png', height: 50.0, width: 50.0,)),
                    trailing: IconButton(
                      color: Colors.deepPurple[900],
                      icon: Icon(Icons.close),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
                Container()
              ],
            ),
          );
        });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      bottomSheet: _showBottomSheet(context),
    );
  }
}
