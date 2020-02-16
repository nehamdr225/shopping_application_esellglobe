import 'package:esell/widget/molecules/BlueAppBar.dart';
import 'package:flutter/material.dart';

class ContactUs extends StatelessWidget {
  final Widget widgets;
  ContactUs({this.widgets});
  @override
  Widget build(BuildContext context) {
    //final size = MediaQuery.of(context).size;
    final colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
        backgroundColor: colorScheme.background,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(55.0),
          child: BlueAppBar(
            title: 'Contact Us',
            elevation: 0.0,
            search: false,
            cart: false,
            onPressed: (){
              Navigator.pop(context);
            },
          ),
        ),
        body: widgets);
  }
}
