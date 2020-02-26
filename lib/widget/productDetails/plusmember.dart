import 'package:esell/state/state.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/atoms/Text.dart';
import 'package:flutter/material.dart';

class PDplusmember extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: Container(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            SizedBox(width: 10.0,),
            Image.asset("images/icons/plusmemb.png", color: Colors.yellow, height: 36.0,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                ),
                FText(
                  text: "Become a plus member",
                  color: textColor,
                  size: 16.0,
                  fontWeight: FontWeight.w500,
                ),
                FText(
                  text: "Get exciting benefits",
                  color: textColor.withOpacity(0.6),
                  size: 14.0,
                  fontWeight: FontWeight.w500,
                ),
                FText(
                  text: "Free Shipping",
                  color: textColor.withOpacity(0.4),
                  size: 12.0,
                  fontWeight: FontWeight.w500,
                ),
                Padding(
                  padding: EdgeInsets.all(12.0),
                ),
              ],
            ),
            FRaisedButton(
              height: 30.0,
              width: 90.0,
              shape: false,
              fontSize: 14.0,
              text: "Explore",
              bg: primaryDark,
              color: Colors.white,
              onPressed: (){},
            ),
            SizedBox(width: 10.0,),
          ],
        ),
      ),
    );
  }
}
