import 'package:flutter/material.dart';
import '../widget/appbar.dart';
import '../pages/productdetail.dart';

class WishlistPage extends StatelessWidget {
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
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBarPage(),
      ),
      backgroundColor: Colors.grey,
      body: Container(
        color: Colors.white,
        child: OrientationBuilder(builder: (context, orientation) {
          return GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 2,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              return WishlistProduct(
                  prodName: productList[index]['name'],
                  prodPicture: productList[index]['picture'],
                  prodPrice: productList[index]['price'],
                  prodSeller: productList[index]['seller'],
                  oldPrice: productList[index]['oldPrice'],
                  prodDetails: productList[index]['details']);
            },
          );
        }),
      ),
    );
  }
}

class WishlistProduct extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodSeller;
  final prodPrice;
  final oldPrice;
  final prodDetails;

  WishlistProduct(
      {this.prodName,
      this.prodPrice,
      this.prodSeller,
      this.prodPicture,
      this.oldPrice,
      this.prodDetails});

  Widget build(BuildContext context) {
    return Card(
        borderOnForeground: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Container(
            height: 500.0,
            width: 50.0,
            padding: EdgeInsets.all(1.0),
            child: Column(
              children: <Widget>[
                Material(
                  borderRadius: BorderRadius.circular(12.0),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => HeroDetails(
                                name: prodName,
                                image: prodPicture,
                                price: prodPrice,
                              )));
                    },
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 100.0,
                          child: Image.asset(prodPicture),
                        ),
                        Divider(),
                        Container(
                            alignment: Alignment.bottomCenter,
                            height: 10.0,
                            child: Text(
                              prodName,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 13.0),
                            )),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                        ),
                        Container(
                            alignment: Alignment.bottomCenter,
                            height: 5.0,
                            child: Text(prodDetails)),
                        Padding(
                          padding: EdgeInsets.all(4.0),
                        ),
                        Container(
                            alignment: Alignment.bottomCenter,
                            height: 5.0,
                            child: Text(prodPrice)),
                      ],
                    ),
                  ),
                ),
                // ButtonTheme(
                //               minWidth: 165.0,
                //               height: 45.0,

                //               child: RaisedButton(

                //                 color: Colors.pink,
                //                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                //                 onPressed: (){},
                //                 child: Text('Move to Cart', style:TextStyle(fontFamily: 'Victorian', fontSize: 26.0, color: Colors.white)),
                //                 )
                //             ),
              ],
            )));
  }
}
