import 'package:esell/pages/src/SubCategory/subCategory.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:flutter/material.dart';

class CategoryPage extends StatefulWidget {
  final String text;
  CategoryPage({this.text});
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final String text;
  _CategoryPageState({this.text});

  final topList = [
    {
      "imageCaption": "Casual Shirt", 
      "imageLocation": "images/tshirt.png"
    },
    {
      "imageCaption": "Formal Shirt",
      "imageLocation": 'images/pant.png',
    },
    {
      "imageCaption": "T-shirt",
      "imageLocation": 'images/shoe.png',
    },
    {
      "imageCaption": "Jacket",
      "imageLocation": 'images/shoe.png',
    }
  ];
  final bottomList = [
    {"imageCaption": "Jean Pants", "imageLocation": "images/tshirt.png"},
    {
      "imageCaption": "Formal Pants",
      "imageLocation": 'images/pant.png',
    },
    {
      "imageCaption": "Track Pants/ Sports Wear",
      "imageLocation": 'images/shoe.png',
    }
  ];
  final footList = [
    {"imageCaption": "Casual Shoes", "imageLocation": "images/tshirt.png"},
    {
      "imageCaption": "Formal Shoes",
      "imageLocation": 'images/pant.png',
    },
    {
      "imageCaption": "Sports Shoes",
      "imageLocation": 'images/shoe.png',
    },
    {
      "imageCaption": "Sandals",
      "imageLocation": 'images/shoe.png',
    }
  ];
  final watchNglass = [
    {
      "imageCaption": "Watches",
      "imageLocation": 'images/shoe.png',
    },
    {
      "imageCaption": "Glasses",
      "imageLocation": 'images/shoe.png',
    }
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: FAppBar(),
      ),
      body: OrientationBuilder(builder: (context, orientation) {
        return GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            childAspectRatio: 0.84,
          ),
          itemCount: topList.length,
          itemBuilder: (BuildContext context, int index) {
            switch (text) {
              case 'top':
                return SubCategory(
                  imageCaption: topList[index]['imageCaption'],
                  imageLocation: topList[index]['imageLocation'],
                );
                break;
              case 'bottom':
                return SubCategory(
                  imageCaption: bottomList[index]['imageCaption'],
                  imageLocation: bottomList[index]['imageLocation'],
                );
                break;
              case 'foot':
                return SubCategory(
                  imageCaption: footList[index]['imageCaption'],
                  imageLocation: footList[index]['imageLocation'],
                );
                break;
              case 'watchNglass':
                return SubCategory(
                  imageCaption: watchNglass[index]['imageCaption'],
                  imageLocation: watchNglass[index]['imageLocation'],
                );
                break;
              default:
                return SubCategory(
                  imageCaption: topList[index]['imageCaption'],
                  imageLocation: topList[index]['imageLocation'],
                );
            }
          },
        );
      }),
    ));
  }
}
