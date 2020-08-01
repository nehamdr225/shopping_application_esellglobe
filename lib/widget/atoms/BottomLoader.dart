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
              return 
              Container(
                padding: EdgeInsets.symmetric(vertical: 120.0, horizontal:105.0),
                //padding: EdgeInsets.fromLTRB(105.0, 120.0, 110.0, 120.0),
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.5),
                  valueColor: AlwaysStoppedAnimation(
                    Theme.of(context).colorScheme.primary,
                  ),
                  strokeWidth: 5.0,
                ),
              );
          }
        }
        return SizedBox.shrink();
        // CircularProgressIndicator(
        //   valueColor: AlwaysStoppedAnimation(
        //     Theme.of(context).colorScheme.secondary,
        //   ),
        //   strokeWidth: 5.0,
        // );
      },
    );
  }
}
