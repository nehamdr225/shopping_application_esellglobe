import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class BottomLoader extends StatefulWidget {
  @override
  _BottomLoaderState createState() => _BottomLoaderState();
}

class _BottomLoaderState extends State<BottomLoader> {
  String state = "success";
  @override
  Widget build(BuildContext context) {
    final status = Provider.of<ProductModel>(context).refresh();
    status.then((data) {
      if (data != null)
        setState(() {
          state = data;
        });
    });
    return Container(
      alignment: Alignment.center,
      child: state == "done"
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text("Nothing more to show!"),
                Icon(Icons.check)
              ],
            )
          : CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).colorScheme.primaryVariant),
              strokeWidth: 5.0
          )
    );
  }
}
