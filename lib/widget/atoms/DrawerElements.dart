import 'package:flutter/material.dart';

class DrawerElements extends StatelessWidget {
  final String title;
  final icon;
  final onTap;
  DrawerElements({this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title, style: Theme.of(context).textTheme.caption),
            leading: Image.asset(
              icon, 
              height: 25.0,
              width: 25.0,
              color: Colors.grey[800],
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: onTap,      
    );
  }
}