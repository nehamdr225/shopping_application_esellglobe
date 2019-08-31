import 'package:flutter/material.dart';

class DrawerElements extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  final onTap;
  DrawerElements({this.title, this.color, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
            leading: Icon(
              icon,
              color: color,
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: onTap,      
    );
  }
}