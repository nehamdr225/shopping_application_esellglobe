import 'package:flutter/material.dart';
import '../pages/productdetail.dart';

class Products extends StatelessWidget {
  final productList = [
    {
      "name": "Suit",
      "picture": "images/1.jpg",
      "price": "Rs. 1500",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 2800"
    },
    {
      "name": "Briefcase",
      "picture": "images/2.png",
      "price": "Rs. 1000",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1500"
    },
    {
      "name": "Shoes",
      "picture": "images/3.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800"
    },
    {
      "name": "Track suit",
      "picture": "images/4.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800"
    },
    {
      "name": "Track suit",
      "picture": "images/5.jpeg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800"
    },
    {
      "name": "brief case",
      "picture": "images/b2.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800"
    },
    {
      "name": "T-Shirt",
      "picture": "images/s1.jpg",
      "price": "Rs. 500",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 800"
    },
    {
      "name": "Shoes",
      "picture": "images/o1.jpg",
      "price": "Rs. 1000",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1500"
    },
    {
      "name": "brief case",
      "picture": "images/b1.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800"
    },
    {
      "name": "Shirt",
      "picture": "images/s4.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800"
    },
    {
      "name": "Brief case",
      "picture": "images/b3.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800"
    },
    {
      "name": "Shoes",
      "picture": "images/o3.jpg",
      "price": "Rs. 1300",
      "seller": " eSellglobe",
      "oldPrice": "Rs. 1800"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150.0,
      child: ListView.builder(
        itemCount: 10,
        scrollDirection: Axis.horizontal,
         itemBuilder: (BuildContext context, int index){
        return SingleProduct(
          prodName: productList[index]['name'],
          prodPicture: productList[index]['picture'],
          prodPrice: productList[index]['price'],
          prodSeller: productList[index]['seller'],
          oldPrice: productList[index]['oldPrice'],
        );
      },
        
      ),
      
    );
  }
}

class SingleProduct extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodSeller;
  final prodPrice;
  final oldPrice;

  SingleProduct({this.prodName, this.prodPrice, this.prodSeller, this.prodPicture, this.oldPrice});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
        child: Container(
            height: 30.0,
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
                  prodPrice: prodPrice,)));
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
                  height: 5.0,
                  child: Text(prodName)
                ),
              ],
            ),
          ) ,
        )
      )
  );
    
  //         child: Container(
  //           width: 150.0,
  //           child: GridTile(
  //             footer: Container(
  //                 color: Colors.white70,
  //                 child: ListTile(
  //                   leading: Text(prodName,
  //                     style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),),
  //                   subtitle: Text(oldPrice,
  //                     style: TextStyle(fontFamily: 'Montserrat', color: Colors.redAccent, fontWeight: FontWeight.bold),),
  //                   title: Text(prodPrice,
  //                   style: TextStyle(fontFamily: 'Montserrat', fontWeight: FontWeight.bold),
  //                 ),),
  //             ),       
  //           child: Image.asset(
  //             prodPicture,
  //             fit: BoxFit.scaleDown,
  //           ),
  //         )
  //       ),
  //     )
  //   )
  // ));
  }
}