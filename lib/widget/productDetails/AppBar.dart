import 'package:esell/pages/pages.dart';
import 'package:esell/widget/molecules/Icons.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:esell/widget/productDetails/Carousel.dart';
import 'package:flutter/material.dart';

class PDAppBar extends StatelessWidget {
  final List<Image> images;
  PDAppBar(this.images);
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return SliverAppBar(
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(Icons.arrow_back),
      ),
      iconTheme: IconThemeData(color: icontheme2),
      backgroundColor: Colors.grey[200],
      floating: true,
      flexibleSpace: PDCarousel(images: images, width: screenWidth * 0.90),
      expandedHeight: 400,
      actions: <Widget>[
        FIcons(
            icon: Icons.shopping_cart,
            alignment: Alignment.centerRight,
            color: Colors.deepPurple[900],
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            }),
        FIcons(
            icon: Icons.bookmark,
            alignment: Alignment.centerRight,
            color: Colors.deepPurple[900],
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WishlistPage()));
            })
      ],
    );
  }
}
