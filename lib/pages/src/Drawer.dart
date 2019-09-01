import 'package:esell/helpers/Api.dart';
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
    final token = user.token;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          token != null
              ? UserAccountsDrawerHeader(
                  accountName: Text(
                      userData.length > 0 ? userData['name'] : "Loading ..."),
                  accountEmail: Text(
                      userData.length > 0 ? userData['email'] : "Loading ..."),
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
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    //gradient: drawercolor
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50.0,
                        child: FlutterLogo(),
                      ),
                      Padding(padding: EdgeInsets.all(12.0),),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FancyText(
                        text: "Login",
                        size: 16.0,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignInPage()));
                        },
                      ),
                      Padding(padding: EdgeInsets.all(8.0),),
                      FancyText(
                        text: "Signup",
                        size: 16.0,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SignUpPage()));
                        },
                      )
                        ],
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
          token != null
              ? DrawerElements(
                  title: 'Account',
                  icon: Icons.person,
                  color: Colors.grey,
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                )
              : Text(''),
          token != null?DrawerElements(
            title: 'Logout',
            icon: Icons.person,
            color: Colors.blueGrey,
            onTap: () {
              logout();
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePageApp()));
              user.token = null;
              user.user = {};
            },
          ): Text(""),
          Divider(
            height: 10.0,
          ),
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
