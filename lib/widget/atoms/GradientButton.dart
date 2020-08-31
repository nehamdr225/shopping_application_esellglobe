import 'package:flutter/material.dart';

class GradientButton extends StatelessWidget {
  final String text;
  final double elevation, width;
  final onPressed;
  final bool notEnoughInfo;
  GradientButton(
      {this.text,
      this.elevation,
      this.onPressed,
      this.width,
      this.notEnoughInfo: false});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: width,
      child: RaisedButton(
        elevation: elevation,
        onPressed: onPressed,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        padding: EdgeInsets.all(0.0),
        child: Ink(
          decoration: BoxDecoration(
              gradient: notEnoughInfo == false
                  ? RadialGradient(
                      colors: [
                        Theme.of(context).colorScheme.primaryVariant,
                        Theme.of(context).colorScheme.primary
                      ],
                      center: Alignment(-0.5, -0.5),
                      radius: 2.5,
                    )
                  : RadialGradient(
                      colors: [Colors.grey[400], Colors.grey[400]]),
              borderRadius: BorderRadius.circular(10.0)),
          child: Container(
            constraints: BoxConstraints(minHeight: 50.0),
            alignment: Alignment.center,
            child: Text(
              text,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
        ),
      ),
    );
  }
}
