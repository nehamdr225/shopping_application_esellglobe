import 'package:flutter/material.dart';

class DrawerElements extends StatelessWidget {
  final String title;
  final icon;
  final onTap;
  final bool titleWidgets;
  final Widget widgets;
  DrawerElements({this.title, this.icon, this.onTap, this.titleWidgets: false, this.widgets});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: titleWidgets == false
      ? Text(title, style: Theme.of(context).textTheme.caption)
      : widgets,
      leading: Image.asset(
        icon,
        height: 25.0,
        width: 25.0,
        color: Colors.black,
      ),
      trailing: Icon(Icons.arrow_right),
      onTap: onTap,
    );
  }
}
