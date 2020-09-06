import 'package:esell/pages/Cart.dart';
import 'package:esell/pages/Signin.dart';
import 'package:esell/widget/atoms/GradientButton.dart';
import 'package:esell/widget/atoms/RaisedButton.dart';
import 'package:esell/widget/molecules/Product.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/AppBar.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class WishlistPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final products = Provider.of<ProductModel>(context);
    final user = Provider.of<UserModel>(context);
    final items = user.wishList;
    final token = user.token;
    print(items);
    return token == null
        ? Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: FAppBar(
                cart: true,
                title: 'Wishlist',
              ),
            ),
            backgroundColor: Colors.white,
            body: Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "You need to Login first",
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .copyWith(fontSize: 16.0),
                ),
                SizedBox(
                  height: 15.0,
                ),
                GradientButton(
                  text: "Login",
                  width: 150.0,
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (_) => SignInPage())); //LoginPhone()
                  },
                ),
              ],
            )))
        : Scaffold(
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(40.0),
              child: FAppBar(
                cart: true,
                title: 'Wishlist',
              ),
            ),
            backgroundColor: Colors.white,
            body: items.length > 0
                ? Container(
                    child: OrientationBuilder(builder: (context, orientation) {
                      return GridView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: items.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount:
                              orientation == Orientation.portrait ? 2 : 3,
                        ),
                        itemBuilder: (BuildContext context, int index) {
                          var product = products.one(items[index], '');
                          return Product(
                              id: product.id,
                              imgheight: 98.0,
                              category: product.category,
                              wishlist: false);
                        },
                      );
                    }),
                  )
                : Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        height: 200.0,
                        width: 300.0,
                        child: Image.asset('images/emptywishlist.png'),
                      ),
                      Text(
                        "Oops..Your wishlist is empty!",
                        style: TextStyle(fontSize: 20.0),
                      ),
                    ],
                  )));
  }
}
