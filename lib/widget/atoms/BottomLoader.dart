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
      child: Row(
        children: <Widget>[
          state == "done"
              ? Column(
                  children: <Widget>[
                    Text("Seems we are done!"),
                    Icon(Icons.check)
                  ],
                )
              : CircularProgressIndicator()
        ],
      ),
    );
  }
}
