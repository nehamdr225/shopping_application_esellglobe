import 'package:esell/helpers/Api.dart';
import 'package:esell/widget/atoms/DrawerElements.dart';
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
                      //color: Colors.grey[200],
                      gradient: drawercolor),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40.0,
                          child: Image.asset(
                            'images/myntralogo.png',
                            height: 45.0,
                            width: 45.0,
                          ),
                        ),
                        // Padding(
                        //   padding: EdgeInsets.all(2.0),
                        // ),
                        Container(
                          color: Colors.transparent,
                          alignment: Alignment.bottomLeft,
                          child: ListTile(
                            title: Text(
                              'Log in   .   Sign up',
                              style: TextStyle(color: Colors.white),
                            ),
                            trailing: Icon(
                              Icons.arrow_right,
                              color: Colors.white,
                            ),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UserPromptApp()));
                            },
                          ),
                        )
                      ])),
          DrawerElements(
            title: 'Top Wear',
            icon: 'images/tshirt.png',
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => CategoryPage(text: 'Top Wear'),
                ),
              );
            },
          ),
          DrawerElements(
            title: 'Bottom Wear',
            icon: 'images/pant.png',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoryPage(text: 'Bottom Wear'),
              ));
            },
          ),
          DrawerElements(
            title: 'FootWear',
            icon: 'images/shoe.png',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoryPage(text: 'Foot Wear'),
              ));
            },
          ),
          DrawerElements(
            title: 'Watches & Glasses',
            icon: 'images/glassesandjunga.png',
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => CategoryPage(text: 'Watches & Glasses'),
              ));
            },
          ),
          Divider(
            color: Colors.grey[500],
            height: 10.0,
          ),
          DrawerElements(
            title: 'Home Page',
            icon: 'images/homepage.png',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => HomePageApp()));
            },
          ),
          DrawerElements(
            title: 'Cart',
            icon: 'images/cart.png',
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => CartPage()));
            },
          ),
          DrawerElements(
            title: 'Wishlist',
            icon: 'images/wishlist.png',
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WishlistPage()));
            },
          ),
          token != null
              ? DrawerElements(
                  title: 'Account',
                  icon: 'images/account.png',
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignInPage()));
                  },
                )
              : Text(''),
          token != null
              ? Column(children: [
                  DrawerElements(
                    title: 'Logout',
                    icon: 'images/logout.png',
                    onTap: () {
                      logout();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HomePageApp()));
                      user.token = null;
                      user.user = {};
                    },
                  ),
                  Divider(
                    color: Colors.grey[500],
                    height: 10.0,
                  ),
                ])
              : Divider(
                  color: Colors.grey[500],
                  height: 5.0,
                ),
          DrawerElements(
            title: 'About',
            icon: 'images/about.png',
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
