import 'package:flutter/material.dart';

class FIcons extends StatelessWidget {
  final IconData icon;
  final Color color;
  FIcons({this.icon, this.color});
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        icon,
        color: color,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }
}
