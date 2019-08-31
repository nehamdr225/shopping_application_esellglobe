import 'package:esell/pages/src/AboutPage.dart';
import 'package:esell/widget/atoms/DrawerElements.dart';
import 'package:flutter/material.dart';
import 'package:esell/widget/molecules/colors.dart';
import 'package:esell/pages/pages.dart';

class DrawerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          UserAccountsDrawerHeader(
            accountName: Text('esellglobe'),
            accountEmail: Text('esellglobe@gmail.com'),
            currentAccountPicture: GestureDetector(
              child: CircleAvatar(
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, color: Colors.black45),
              ),
            ),
            decoration: BoxDecoration(
              gradient: drawercolor,
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
            title: 'Category',
            icon: Icons.category,
            color: Colors.greenAccent,
            onTap: () {
              Navigator.pop(context);
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
          DrawerElements(
            title: 'Account',
            icon: Icons.person,
            color: Colors.grey,
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SignInPage()));
            },
          ),
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
