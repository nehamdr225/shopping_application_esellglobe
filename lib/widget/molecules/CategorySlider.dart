import 'package:esell/pages/src/SubCategory/CategoryPage.dart';
import 'package:flutter/material.dart';
// import 'package:EsellGlobe/helpers/Api.dart';

class FSlider extends StatelessWidget {
  final products;
  FSlider({this.products});

  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate(
        <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Text('Categories', style: Theme.of(context).textTheme.title),
          ),
          HorizontalList(),
        ],
      ),
    );
  }
}

class HorizontalList extends StatelessWidget {
  final scrollList = [
    {
      "name": "top",
      "imageCaption": "Top Wear",
      "imageLocation": "images/tshirt.png"
    },
    {
      "name": "bottom",
      "imageCaption": "Bottom Wear",
      "imageLocation": 'images/pant.png',
    },
    {
      "name": "foot",
      "imageCaption": "Foot Wear",
      "imageLocation": 'images/shoe.png',
    },
    {
      "name": "watchesNglasses",
      "imageCaption": "Watches & Glasses",
      "imageLocation": 'images/shoe.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder: (BuildContext context, int index) {
          return Category(
            index: index,
            imageCaption: scrollList[index]['imageCaption'],
            imageLocation: scrollList[index]['imageLocation'],
          );
        },
      ),
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final imageCaption;
  final int index;

  Category({this.imageCaption, this.imageLocation, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(2.0),
        child: InkWell(
          onTap: () {
            switch (index) {
              case 0:
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CategoryPage(text: "top")));
                break;
              case 1:
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CategoryPage(text: "bottom")));
                break;
              case 2:
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => CategoryPage(text: "foot")));
                break;
              case 3:
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        CategoryPage(text: "watchNglass")));
                break;
            }
          },
          child: Container(
              width: 90.0,
              child: ListTile(
                title: Image.asset(
                  imageLocation,
                  width: 100.0,
                  height: 35.0,
                ),
                subtitle: Container(
                  alignment: Alignment.topCenter,
                  child: Text(
                    imageCaption,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontFamily: 'Ropa Sans', fontSize: 12.0),
                  ),
                ),
              )),
        ));
  }
}
