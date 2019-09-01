import 'package:esell/widget/atoms/DrawerElements.dart';
import 'package:esell/widget/atoms/FancyText.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:esell/pages/pages.dart';
import 'package:esell/state/state.dart';
import 'package:provider/provider.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final userData = user.user;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          user != null
              ? UserAccountsDrawerHeader(
                  accountName: Text(userData['name']),
                  accountEmail: Text(userData['email']),
                  currentAccountPicture: GestureDetector(
                    child: CircleAvatar(
                      backgroundColor: Colors.white24,
                      child: Icon(Icons.person, color: Colors.black45),
                    ),
                  ),
                  decoration: BoxDecoration(
                    gradient: drawercolor,
                  ),
                )
              : DrawerHeader(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      FancyText(
                        text: "Login",
                        size: 24.0,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInPage()));
                        },
                      ),
                      FancyText(
                        text: "Signup",
                        size: 24.0,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                      )
                    ],
                  ),
                ),
          DrawerElements(
            title: 'Home Page',
            icon: Icons.home,
            color: Colors.blue,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePageApp()));
            },
          ),
          DrawerElements(
            title: 'My Orders',
            icon: Icons.shopping_basket,
            color: Colors.orangeAccent,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
          DrawerElements(
            title: 'Cart',
            icon: Icons.shopping_cart,
            color: Colors.greenAccent,
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
          DrawerElements(
            title: 'Wishlist',
            icon: Icons.favorite_border,
            color: Colors.red,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WishlistPage()));
            },
          ),
          user != null?DrawerElements(
            title: 'Account',
            icon: Icons.person,
            color: Colors.grey,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInPage()));
            },
          ): Text(''),
          Divider(
            height: 80.0,
          ),
          // DrawerElements(
          //   title: 'Settings',
          //   icon: Icons.settings,
          //   color: Colors.blueGrey,
          //   onTap: () {
          //     Navigator.pop(context);
          //   },
          // ),
          DrawerElements(
            title: 'About',
            icon: Icons.help_outline,
            color: Colors.black,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => AboutPage()));
            },
          ),
        ],
      ),
    );
  }
}
