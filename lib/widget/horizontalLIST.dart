import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: <Widget>[
          
          Category(
            imageLocation: 'images/tshirt.png',
            imageCaption: 'Shirt',
          ),
          Category(
            imageLocation: 'images/pant.png',
            imageCaption: 'Pant',
          ),
          Category(
            imageLocation: 'images/shoe.png',
            imageCaption: 'Shoes',
          ),
          Category(
            imageLocation: 'images/briefcase-128.png',
            imageCaption: 'Briefcase',
          ),
          Category(
            imageLocation: 'images/tshirt.png',
            imageCaption: 'Shirt',
          ),

        ],

      ),
      
    );
  }
}

class Category extends StatelessWidget {
  final String imageLocation;
  final String imageCaption;

  Category({this.imageCaption, this.imageLocation});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(2.0),
      child: InkWell(
        onTap: (){},
        child: Container(
          width: 90.0,
          child: ListTile(
            title: Image.asset(imageLocation,
              width: 80.0,
              height: 35.0,),
            subtitle: Container(
              alignment: Alignment.topCenter,
              child:Text(imageCaption, style: TextStyle(fontFamily: 'Montserrat', fontSize: 12.0),),
          
          ),
        )
      ),
    ));
  }
}