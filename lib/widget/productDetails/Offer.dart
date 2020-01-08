import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PDoffer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 14.0, top: 10.0),
            child: Text(
              "Available offers",
              style: Theme.of(context)
                  .textTheme
                  .body1
                  .copyWith(fontWeight: FontWeight.w600, fontSize: 15.0),
              textAlign: TextAlign.left,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 5.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(CupertinoIcons.tags_solid, color: Colors.green, size: 19.0,),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "5% Unlimited Cashback on Esell Axis Bank Credit card",
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(fontSize: 14.0),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: IconButton(
                    iconSize: 12.0,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[500],
                      size: 16.0,
                    ),
                    onPressed: () {},
                  ),
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 0.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Icon(CupertinoIcons.tags_solid, color: Colors.green, size: 19.0,),
                Flexible(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Extra 5% off* with Axis Bank Buxx Credit Card",
                      style: Theme.of(context)
                          .textTheme
                          .body1
                          .copyWith(fontSize: 14.0),
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: IconButton(
                    iconSize: 12.0,
                    icon: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey[500],
                      size: 16.0,
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.0,)
        ],
      ),
    );
  }
}
