import 'package:EsellGlobe/pages/pages.dart';
import 'package:EsellGlobe/widget/colors.dart';
import 'package:EsellGlobe/widget/productDetails/Carousel.dart';
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
      flexibleSpace: PDCarousel(images: images, width: screenWidth * 0.90 ),
      expandedHeight: 400,
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.share),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        IconButton(
          icon: Icon(Icons.bookmark_border),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => WishlistPage()));
          },
        ),
        IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => CartPage()));
          },
        ),
      ],
    );
  }
}
