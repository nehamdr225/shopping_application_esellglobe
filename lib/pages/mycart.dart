import 'package:flutter/material.dart';
import '../widget/colors.dart';
//import '../widget/appbar.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  var productList= [
    {
      "name": "Suit",
      "picture": "images/1.jpg",
      "price": "Rs. 1500",
      "size": "M",
      "Quantity": "1 ",
      "color": "Red"
    },
    {
      "name": "Shoes",
      "picture": "images/o3.jpg",
      "price": "Rs. 1300",
      "size": "7",
      "Quantity": "1",
      "color": "Red"
    }
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: AppBar(
           elevation: 0.0,
          iconTheme: IconThemeData(color: icontheme2),
          backgroundColor: Colors.white,
          title: Text('My cart',  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.pink, fontFamily: 'Ropa Sans',), textAlign: TextAlign.center,),
          leading: IconButton(icon: Icon(Icons.arrow_back,),
           onPressed: (){
                  Navigator.pop(context);
                } ,),
        ),
      ) ,
        backgroundColor: Colors.grey[200],  
        //footer icon buttons
        persistentFooterButtons: <Widget>[
          
          ButtonTheme(
            minWidth: 165.0,
            height: 45.0,
            child: RaisedButton(
              color: Colors.white,   
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),            
              onPressed: (){
              },
              child: Text('Total', style:TextStyle(fontFamily: 'Victorian', fontSize: 26.0, color: Colors.black)),
            ),
          ),
          ButtonTheme(
            minWidth: 165.0,
            height: 45.0,
            child: RaisedButton(
              color: icontheme2,   
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),            
              onPressed: (){},
              child: Text('Check Out', style:TextStyle(fontFamily: 'Victorian', fontSize: 26.0, color: Colors.white)),
            ),
          ),
        ], 
        body: ListView.builder(
          itemCount: 2,
          itemBuilder: (context,index){
            return CartListview(
              prodName: productList[index]['name'],
              prodPicture: productList[index]['picture'],
              prodPrice: productList[index]['price'],
              prodSize: productList[index]['size'],
              prodQuantity:productList[index]['Quantity'],
              prodColor: productList[index]['color'],
            );
          },
        ),
    
      )
    
    );
  }
}

class CartListview extends StatelessWidget {
  final prodName;
  final prodPicture;
  final prodSize;
  final prodPrice;
  final prodQuantity;
  final prodColor;

  CartListview({this.prodName, this.prodPrice, this.prodSize, this.prodPicture, this.prodQuantity, this.prodColor});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(prodPicture, width:80.0, height:80.0),
        title: Text(prodName),
        subtitle: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  child: Text('Size:',  style: TextStyle(fontWeight: FontWeight.bold)),
                  padding: EdgeInsets.all(8.0),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(prodSize,),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text('Color:',  style: TextStyle(fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(prodColor),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(prodPrice,  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.red)),
            )
          ],
        ),
      ),      
    );
  }
}