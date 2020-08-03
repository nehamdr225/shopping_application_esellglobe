import 'package:carousel_pro/carousel_pro.dart';
import 'package:esell/widget/atoms/loginOptions.dart';
import 'package:flutter/cupertino.dart';
// import 'package:esell/widget/molecules/Icons.dart';
// import 'package:esell/widget/molecules/colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

class PDCarousel extends StatelessWidget {
  final width;
  final id;
  final length;
  final List<Image> images;
  PDCarousel({this.images, this.width, this.id, this.length}); //
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    return Stack(
      children: <Widget>[
        Center(
          child: Carousel(
              boxFit: BoxFit.fill,
              images: images,
              autoplay: false,
              dotSize: 6.0,
              dotColor: Colors.grey[500],
              dotIncreasedColor: Colors.grey[500],
              animationDuration: Duration(seconds: 2),
              overlayShadowColors: Color(0xff0d47a1),
              dotBgColor: Colors.transparent,
              indicatorBgPadding: 12.0,
            ),
          
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: Icon(
              CupertinoIcons.heart_solid,
            ),
            focusColor: Colors.red,
            color: user.findWishlistItem(id) != true
                ? Colors.grey[600]
                : Colors.red,
            onPressed: () {
              user.token != null?
              user.findWishlistItem(id) != true
                  ? user.addToWishList(id)
                  : print("already in wishlist"): _showBottomSheet(context);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Image.asset("images/icons/stack.png", color: Colors.grey[500],),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("$length", style: TextStyle(fontFamily: 'Bree', fontSize: 20.0, color: Colors.grey[700],),),
                )

              ],
            ),
          
        ),
      ],
    );
  }
  _showBottomSheet(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  IconButton(
                    alignment: Alignment.centerRight,
                    color: primary,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Center(
                        child: Image.asset(
                      'images/logo/logoonly1.png',
                      height: 60.0,
                      width: 60.0,
                    )),
                  ),
                  Container(
                    // buttons
                    child: LoginOptions(),
                  ),
                ],
              ),
            ),
          );
        });
  }
}
