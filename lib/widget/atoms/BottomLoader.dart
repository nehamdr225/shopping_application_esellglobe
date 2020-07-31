import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class BottomLoader extends StatefulWidget {
  @override
  _BottomLoaderState createState() => _BottomLoaderState();
}

class _BottomLoaderState extends State<BottomLoader> {
  String state;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Provider.of<ProductModel>(context).refresh(),
      builder: (context, AsyncSnapshot<RefreshStatus> snapshot) {
        if (snapshot.hasData) {
          switch (snapshot.data) {
            case RefreshStatus.noMoreProductsToShow:
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Nothing more to show!"),
                  Icon(
                    Icons.check,
                    color: primaryDark,
                  )
                ],
              );
            default:
              return CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(
                  Theme.of(context).colorScheme.primaryVariant,
                ),
                strokeWidth: 5.0,
              );
          }
        }
        return CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            Theme.of(context).colorScheme.primaryVariant,
          ),
          strokeWidth: 5.0,
        );
      },
    );
  }
}
