import 'package:carousel_pro/carousel_pro.dart';
// import 'package:esell/widget/molecules/Icons.dart';
// import 'package:esell/widget/molecules/colors.dart';
import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:esell/state/state.dart';

class PDCarousel extends StatelessWidget {
  final width;
  final id;
  final List<Image> images;
  PDCarousel({this.images, this.width, this.id}); //
  @override
  Widget build(BuildContext context) {
    //final user = Provider.of<UserModel>(context);
    return Stack(
      children: <Widget>[
        Container(
          width: width,
          child: Carousel(
            boxFit: BoxFit.fill,
            images: images,
            autoplay: false,
            dotSize: 6.0,
            animationDuration: Duration(seconds: 2),
            overlayShadowColors: Color(0xff0d47a1),
            dotBgColor: Colors.transparent,
            indicatorBgPadding: 12.0,
          ),
        ),
        // Align(
        //   alignment: Alignment.topRight,
        //           child: FIcons(
        //     icon: user.findWishlistItem(id) != true
        //         ? Icons.bookmark_border
        //         : Icons.bookmark,
        //     color: iconthemedark,
        //     alignment: Alignment.centerRight,
        //     onPressed: () {
        //       user.findWishlistItem(id) != true
        //           ? user.addToWishList(id)
        //           : print("already in wishlist");
        //     },
        //   ),
        // )
      ],
    );
  }
}
