import 'package:flutter/material.dart';
import '../widget/colors.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart'; 
import '../pages/wishlist.dart';
import '../pages/mycart.dart';



class HeroDetails extends StatefulWidget {
  HeroDetails({this.prodName, this.prodPicture, this.prodPrice});
  final prodName;
  final prodPrice;
  final prodPicture;

  @override
  _HeroDetailsState createState() => _HeroDetailsState();
}

class _HeroDetailsState extends State<HeroDetails> {

  _HeroDetailsState({this.prodName, this.prodPicture, this.prodPrice});
  final prodName;
  final prodPrice;
  final prodPicture;
  var rating = 0.0;

  @override
  Widget build(BuildContext context) {
    Widget imageCarousel = Container(
      child: Carousel(
        boxFit: BoxFit.contain,
        images:[
          AssetImage('images/1.jpg',),
          AssetImage('images/1.jpg'),
        ],
        autoplay: false,
        dotSize: 6.0,
        overlayShadowColors: Color(0xff0d47a1),
        dotBgColor: Colors.transparent,
        indicatorBgPadding: 12.0,
      ),
    );
    return SafeArea(
      child: Scaffold(
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
                Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> WishlistPage()));
              },
              child: Text('Wish List', style:TextStyle(fontFamily: 'Victorian', fontSize: 26.0, color: Colors.black)),
            ),
          ),
          ButtonTheme(
            minWidth: 165.0,
            height: 45.0,
            child: RaisedButton(
              color: icontheme2,   
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),            
              onPressed: (){
                 Navigator.of(context).push(
                MaterialPageRoute(builder: (context)=> CartPage()));
              },
              child: Text('Add to Cart', style:TextStyle(fontFamily: 'Victorian', fontSize: 26.0, color: Colors.white)),
            ),
          ),
        ], 
        body: CustomScrollView(           
        slivers:<Widget>[
          SliverAppBar(
            iconTheme: IconThemeData(color: icontheme2),
            backgroundColor: Colors.grey[200],
            floating: true,
            flexibleSpace: imageCarousel,
            expandedHeight: 400,
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.share),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.bookmark_border),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),              
            ],),

          SliverList(
            delegate: SliverChildListDelegate(
              <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                  height: 230.0,
                  width: 360.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0))),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 8.0),),
                        
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            Text("  Suit Piece", style: TextStyle( fontFamily: 'Victorian', fontSize: 32.0, 
                                color: Colors.black), 
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 40.0),
                            ),
                            Column(children: [
                              Text('Rate this item', style: Theme.of(context).textTheme.caption,),
                              SmoothStarRating(
                              allowHalfRating: true,
                              onRatingChanged: (v) {
                                rating = v;
                                setState(() {});
                              },
                              starCount: 5,
                              rating: rating,
                              size: 28.0,
                              color: Colors.yellow,
                              borderColor: Colors.black45,
                              spacing:0.0
                            )
                            ],)
                          ],
                        ),
                        Divider(color: Colors.black26,),
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Container(
                            child: Table(
                            children: [
                              TableRow(children: [
                                Text("Price", style: Theme.of(context).textTheme.body2, ),
                                Text("Rs.2500 \n  ", style: Theme.of(context).textTheme.body2,),                  
                              ]),
                              
                              TableRow(children: [
                                Text("Color", style: Theme.of(context).textTheme.body2,),
                                Text('Dark maroon red color \n ', style: Theme.of(context).textTheme.body2,),                  
                              ]),

                              TableRow(children: [
                                Text("Descrption", style: Theme.of(context).textTheme.body2,),
                                Text('It is a 3 piece suit.  ', 
                                      style: TextStyle( 
                                        fontFamily: 'Ropa Sans', 
                                        fontSize: 18.0,
                                      color: Colors.grey[700]), ) , 
                                      // Text('It is a 3 piece suit.  ', 
                                      // style: TextStyle( 
                                      //   fontFamily: 'Ropa Sans', 
                                      //   fontSize: 18.0,
                                      // color: Colors.grey[700]), ) ,                  
                              ]),
                            ] 
                          ),
                          ),
                        )
                      ],
                    ),
                )
                ),
                Container(
                   padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                   height: 175.0,
                   width: 360.0,
                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0))),
                   child: Card(
                     color: Colors.white,
                     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                     child: Column(
                       children: <Widget>[
                         Padding(
                           padding: EdgeInsets.all(12.0),
                           child: Container(
                             child: Column(
                               children: [
                                Text("You pay only: Rs.2000", style: Theme.of(context).textTheme.body2, ),
                                Text("Apply the following coupon during checkout", 
                                    style: Theme.of(context).textTheme.caption, ),
                                Divider(),
                                Row( mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  Text("Apply Coupon", style: Theme.of(context).textTheme.body2, textAlign: TextAlign.center),
                                  Text("ESELLGLOBE1000",style: Theme.of(context).textTheme.title, ),
                                ],),
                                Text("Coupon is only applicable on purchase greater than Rs. 1000", 
                                    style: Theme.of(context).textTheme.caption,
                                ),
                                Divider(),
                                Text("Exchange Policy", style: Theme.of(context).textTheme.body2, textAlign: TextAlign.center),
                                Text("Can be returned within 7 days of buying",style: Theme.of(context).textTheme.title, ),
                                
                               ]),
                           ),
                         )
                       ],
                     ),
                 )
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                  height: 150.0,
                  width: 360.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0))),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(8.0),),
                        Row(
                          children: <Widget>[
                            Padding(padding: EdgeInsets.only(right: 12.0),),
                            Text("Select Size ", style: Theme.of(context).textTheme.body2, textAlign: TextAlign.left, ),
                            Padding(
                              padding: EdgeInsets.only(right: 160.0),
                            ),
                            InkWell(
                              onTap: (){},
                              child: Text("view size chart", style: Theme.of(context).textTheme.caption.copyWith(decoration: TextDecoration.underline), textAlign: TextAlign.right, ),
                            )
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.all(18.0),
                          child: Row(
                            children: [
                            InkWell(
                              onTap: (){},
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black45)
                                ),
                                child: Text("S", style: TextStyle(fontFamily: "Ropa Sans", fontSize: 32.0, color: Colors.black38), textAlign: TextAlign.center,),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                            ),
                            InkWell(
                              onTap: (){},
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black45)
                                ),
                                child: Text("M", style: TextStyle(fontFamily: "Ropa Sans", fontSize: 32.0, color: Colors.black38), textAlign: TextAlign.center,),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                            ),
                            InkWell(
                              onTap: (){},
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black45)
                                ),
                                child: Text("L", style: TextStyle(fontFamily: "Ropa Sans", fontSize: 32.0, color: Colors.black38), textAlign: TextAlign.center,),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.all(5.0),
                            ),
                            InkWell(
                              onTap: (){},
                              child: Container(
                                height: 40.0,
                                width: 40.0,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: Colors.black45)
                                ),
                                child: Text("XL", style: TextStyle(fontFamily: "Ropa Sans", fontSize: 32.0, color: Colors.black38), textAlign: TextAlign.center,),
                              ),
                            ),
                            
                          ]),
                        )
                      ],  
                    ),
                )
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                  height: 250.0,
                  width: 360.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0))),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.all(8.0),),
                        Text("Product Details", style: Theme.of(context).textTheme.body2, textAlign: TextAlign.left, ),                       
                        Text("It is a three piece suit...", style: Theme.of(context).textTheme.title, textAlign: TextAlign.left, ),                       
                        Padding(padding: EdgeInsets.all(8.0),),
                        Text("Size & Fit", style: Theme.of(context).textTheme.body2, textAlign: TextAlign.left, ),                       
                        Text("The models (height: 6'1'') is wearing a size L ", style: Theme.of(context).textTheme.title, textAlign: TextAlign.left, ),                       
                        Padding(padding: EdgeInsets.all(8.0),),
                        Text("Material & Care", style: Theme.of(context).textTheme.body2, textAlign: TextAlign.left, ),                       
                        Text("Suit Piece: 50% Cotton\n Dry Cleaning", style: Theme.of(context).textTheme.title, textAlign: TextAlign.left, ),                       
                      
                      ]
                    ),  
                  )
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(8.0, 0.0, 8.0, 8.0),
                  height: 360.0,
                  width: 360.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(12.0))),
                  child: Card(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0)),
                    child: Column(
                      children: <Widget>[
                        Padding(padding: EdgeInsets.only(top: 8.0),),
                        Text("Comments", style: TextStyle( fontFamily: 'Victorian', 
                                fontSize: 32.0 ,color: Colors.black45), 
                        ),
                        Divider(color: Colors.black26,),
                        Padding(
                          padding: EdgeInsets.all(12.0),
                          child: Container(
                            child: Table(
                            children: [
                              TableRow(children: [
                                Text("Neha M.", style: Theme.of(context).textTheme.body2, ),
                                Text("It is good.\n  ", style: Theme.of(context).textTheme.body2,),                  
                              ]),

                            ] 
                          ),
                          ),
                        )
                      ],
                    ),
                )
                ),
              ]
            ),
          )
          
        ]
          
      ),
      )
    );
  }
}   
  
