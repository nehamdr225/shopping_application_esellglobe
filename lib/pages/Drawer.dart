import 'package:flutter/material.dart';
import 'package:EsellGlobe/widget/colors.dart';
import 'package:EsellGlobe/pages/Signin.dart';
import 'package:EsellGlobe/pages/Cart.dart';
import 'package:EsellGlobe/pages/Wishlist.dart';

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
          ListTile(
            title: Text('Home Page'),
            leading: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('My Orders'),
            leading: Icon(Icons.shopping_basket, color: Colors.orangeAccent),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
          ListTile(
            title: Text('Category'),
            leading: Icon(Icons.category, color: Colors.greenAccent),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('Wishlist'),
            leading: Icon(Icons.favorite, color: Colors.red),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
             Navigator.push(
                  context, MaterialPageRoute(builder: (context) => WishlistPage()));
            },
          ),
          ListTile(
            title: Text('Account'),
            leading: Icon(Icons.person),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
//                Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SignInPage()),
              );
            },
          ),
          Divider(
            height: 80.0,
          ),
          ListTile(
            title: Text('Settings'),
            leading: Icon(Icons.settings, color: Colors.blueGrey),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text('About'),
            leading: Icon(Icons.help_outline, color: Colors.black),
            trailing: Icon(Icons.arrow_right),
            onTap: () {
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
