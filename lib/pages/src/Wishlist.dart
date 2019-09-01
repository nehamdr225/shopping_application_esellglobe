import 'package:esell/widget/molecules/Product.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductModel>(context);
    final wishlist = Provider.of<WishlistModel>(context);
    final items = wishlist.wishList;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(40.0),
        child: FAppBar(cart: true,),
      ),
      backgroundColor: Colors.grey[200],
      body: Container(  
        child: OrientationBuilder(builder: (context, orientation) {
          return GridView.builder(
            scrollDirection: Axis.vertical,
            itemCount: wishlist.count(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: orientation == Orientation.portrait ? 2 : 3,
            ),
            itemBuilder: (BuildContext context, int index) {
              var product = products.one(items[index]);
              return Container(
                height: 212.0,
                child:Product(
                  id: product['_id'],
                  name: product['name'],
                  image: product['media'][0]['src'][0],
                  price: product['price'],
                  seller: product['seller'],
                  details: product['description']),);
            },
          );
        }),
      ),
    );
  }
}
