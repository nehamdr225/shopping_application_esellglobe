import 'package:flutter/material.dart';
import '../widget/appbar.dart';
import '../pages/productdetail.dart';
import '../pages/wishlist.dart';

class AllProductsPage extends StatelessWidget {
  final productList = [
    {
      "name": "Suit",
      "picture": "images/1.jpg",
      "price": "Rs. 1500",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 2800",
      "details": " it is a very nice product"
    },
    {
      "name": "Briefcase",
      "picture": "images/2.png",
      "price": "Rs. 1000",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1500",
      "details": " it is a very nice product"
    },
    {
      "name": "Shoes",
      "picture": "images/3.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
    {
      "name": "Track suit",
      "picture": "images/4.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
    {
      "name": "Track shoe",
      "picture": "images/5.jpeg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
    {
      "name": "brief case",
      "picture": "images/b2.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
    {
      "name": "T-Shirt",
      "picture": "images/s1.jpg",
      "price": "Rs. 500",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 800",
      "details": " it is a very nice product"
    },
    {
      "name": "Shoes",
      "picture": "images/o1.jpg",
      "price": "Rs. 1000",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1500",
      "details": " it is a very nice product"
    },
    {
      "name": "brief case",
      "picture": "images/b1.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
    {
      "name": "Shirt",
      "picture": "images/s4.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
    {
      "name": "Brief case",
      "picture": "images/b3.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
    {
      "name": "Shoes",
      "picture": "images/o3.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
    {
      "name": "brief case",
      "picture": "images/b1.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
    {
      "name": "Shirt",
      "picture": "images/s4.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
    {
      "name": "Brief case",
      "picture": "images/b3.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
    {
      "name": "Shoes",
      "picture": "images/o3.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
        {
      "name": "brief case",
      "picture": "images/b1.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
    {
      "name": "Shirt",
      "picture": "images/s4.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
    {
      "name": "Brief case",
      "picture": "images/b3.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    },
    {
      "name": "Shoes",
      "picture": "images/o3.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800",
      "details": " it is a very nice product"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(40.0),
          child: AppBarPage(),
        ),
      body: OrientationBuilder(
        builder: (context, orientation){
        return GridView.builder(
          itemCount: 20,
          scrollDirection: Axis.vertical,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: orientation==Orientation.portrait? 2:3,
            childAspectRatio: 1.0,
          ),
          itemBuilder: (BuildContext context, int index){
            return SingleProduct(
              prodName: productList[index]['name'],
              prodPicture: productList[index]['picture'],
              prodPrice: productList[index]['price'],
              prodSeller: productList[index]['seller'],
              oldPrice: productList[index]['oldPrice'],
              prodDetails: productList[index]['details']
            );    
          },
        );
        }
    )
    );
  }
}

class SingleProduct extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodSeller;
  final prodPrice;
  final oldPrice;
  final prodDetails;

  SingleProduct({this.prodName, this.prodPrice, this.prodSeller, this.prodPicture, this.oldPrice, this.prodDetails});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
        child: Container(
            height: 200.0,
            width: 100.0,
            padding: EdgeInsets.all(1.0),
              child: Material(
              borderRadius: BorderRadius.circular(12.0),
              child: InkWell(
              onTap: (){
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> HeroDetails(
                  prodName: prodName,
                  prodPicture: prodPicture,
                  prodPrice: prodPrice,
                )));
            },
            child: Column(
              children: <Widget>[
                Container(
                  height: 100.0,
                  child: Image.asset(prodPicture),
                ),
                Divider(),
                // IconButton(
                //   alignment: Alignment.bottomRight,
                //   icon: Icon(Icons.bookmark_border),
                //   onPressed: (){},
                // ),
                Container(
                 // alignment: Alignment.bottomLeft,
                  height: 10.0,
                  child: Row(children: <Widget>[
                    Text(prodName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.0), textAlign: TextAlign.center,),
                    Padding(
                      padding: EdgeInsets.only(right: 65.0),
                    ),
                    IconButton(icon: Icon(Icons.bookmark_border,
                              size:  12.0 ,),
                    alignment: Alignment.topRight,
                                onPressed: (){
                                  Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context)=> WishlistPage()));
                                },)  
                  ],)
                  
                ),
                Padding(padding: EdgeInsets.all(4.0),),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 5.0,
                  child: Text(prodDetails)
                ),
                Padding(padding: EdgeInsets.all(4.0),),
                Container(
                  alignment: Alignment.bottomCenter,
                  height: 5.0,
                  child: Text(prodPrice)
                ),

              ],
            ),
          ) ,
        )
      )
  );
  }
}