import 'package:carousel_pro/carousel_pro.dart';
import 'package:esell/widget/atoms/BrandLogos.dart';
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
            dotIncreaseSize: 1.5,
            dotColor: Colors.grey[400].withOpacity(0.5), //Colors.transparent,
            dotIncreasedColor: Colors.grey[400].withOpacity(0.5),
            animationDuration: Duration(seconds: 1),
            overlayShadowColors: Color(0xff0d47a1),
            dotBgColor: Colors.transparent,
            indicatorBgPadding: 12.0,
          ),
        ),
        Align(
          alignment: Alignment.topRight,
          child: IconButton(
            icon: user.findWishlistItem(id) != true
            ? Icon(
              CupertinoIcons.heart,
            ): Icon(CupertinoIcons.heart_solid),
            focusColor: Colors.red,
            color: user.findWishlistItem(id) != true
                ? Colors.grey[600]
                : Colors.red,
            onPressed: () {
              user.token != null
                  ? user.findWishlistItem(id) != true
                      ? user.addToWishList(id)
                      : print("already in wishlist")
                  : _showBottomSheet(context);
            },
          ),
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Image.asset(
                "images/icons/stack.png",
                color: Colors.black54,
                height: 18.0,
                width: 18.0,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(top: 8.0, right: 8.0, bottom: 8.0),
                child: Text(" $length",
                    style: Theme.of(context).textTheme.subtitle1),
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
              height: 350.0,
              color: Colors.white,
              child: ListView(
                children: <Widget>[
                  IconButton(
                    alignment: Alignment.centerRight,
                    color: primaryDark,
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  BrandLogos(
                    height: 90.0,
                    width: 90.0,
                  ),
                  LoginOptions(),
                ],
              ),
            ),
          );
        });
  }
}
