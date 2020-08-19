import 'package:esell/state/src/user.dart';
import 'package:esell/widget/atoms/Forms.dart';
import 'package:esell/widget/atoms/GradientButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PDratingNreview extends StatefulWidget {
  final id;
  final rating;
  PDratingNreview(this.id, this.rating);
  @override
  _PDratingNreviewState createState() => _PDratingNreviewState();
}

class _PDratingNreviewState extends State<PDratingNreview> {
  double localRating;
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text("Rate this app",
          textAlign: TextAlign.start,
          style: Theme.of(context).textTheme.headline3),
      Text("Tell others what you think",
          textAlign: TextAlign.start,
          style: Theme.of(context)
              .textTheme
              .subtitle2
              .copyWith(color: Colors.grey[500])),
      Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Align(
          alignment: Alignment.center,
          child: SmoothStarRating(
            allowHalfRating: true,
            onRatingChanged: (v) {
              setState(() {
                localRating = v;
              });
              Provider.of<UserModel>(context, listen: false)
                  .rateProduct(widget.id, v)
                  .then((value) => print(value));
            },
            starCount: 5,
            rating: localRating ?? widget.rating ?? 0.0,
            size: 34,
            color: Theme.of(context).colorScheme.primary, // secondary
            borderColor: Theme.of(context).colorScheme.primary,
            spacing: 0.0,
          ),
        ),
      ), //working wala i will change the style later to look like belows.
      // Padding(
      //   padding: const EdgeInsets.symmetric(vertical:8.0),
      //   child: Stars(
      //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //     color: Theme.of(context).buttonColor,
      //     size: 34.0,
      //   ),
      // ), //only for show
      InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                String localData;
                return SimpleDialog(
                  backgroundColor: Theme.of(context).colorScheme.background,
                  children: <Widget>[
                    SimpleDialogOption(
                      child: FForms(
                        minLines: 1,
                        maxLines: 10,
                        borderColor: Theme.of(context).textTheme.caption.color,
                        labeltext: true,
                        text: 'Description',
                        textColor: Theme.of(context).textTheme.caption.color,
                        onChanged: (value) {
                          setState(() {
                            localData = value;
                          });
                        },
                        validator: (val) => val.length < 20
                            ? 'Description must be at least 20 characters!'
                            : null,
                      ),
                    ),
                    SimpleDialogOption(
                        child: GradientButton(
                      text: "Save",
                      elevation: 0.0,
                      onPressed: () {
                        //     Navigator.pop(context);
                      },
                    ))
                  ],
                );
              });
          // showDialog(
          //     context: context,
          //     builder: (BuildContext context) {
          //       return Container(
          //         height: 400.0,
          //         color: Theme.of(context).colorScheme.background,
          //         child: CupertinoAlertDialog(
          //           actions: [Container(height: 100.0, child: Text('HELLO'))],
          //         ),
          //       );
          //     });
          // Navigator.of(context).push(MaterialPageRoute(
          //   builder: (context) =>
          // ));
        },
        child: Text("Write a review",
            textAlign: TextAlign.start,
            style: Theme.of(context).textTheme.caption.copyWith(
                  color: Color(0xff3E91CC),
                )),
      )
    ]);
  }
}
