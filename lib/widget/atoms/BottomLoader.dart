import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class BottomLoader extends StatefulWidget {
  BottomLoader({Key key}) : super(key: key);

  _BottomLoaderState createState() => _BottomLoaderState();
}

class _BottomLoaderState extends State<BottomLoader> {
  @override
  Widget build(BuildContext context) {
    final state = Provider.of<ProductModel>(context).refresh();

    return Container(
      child: Row(
        children: <Widget>[
          state == null
              ? CircularProgressIndicator()
              : state == 'loading'
                  ? CircularProgressIndicator()
                  : Column(
                      children: <Widget>[Text(state), Icon(Icons.check)],
                    )
        ],
      ),
    );
  }
}
