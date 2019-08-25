import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:EsellGlobe/pages/Home.dart';
import 'package:EsellGlobe/pages/UserPromt.dart';

// import 'package:EsellGlobe/store/Store.dart';
import 'package:EsellGlobe/store/ProductModel.dart';
import 'package:EsellGlobe/store/CartModel.dart';
import 'package:EsellGlobe/store/UserModel.dart';
import 'package:EsellGlobe/store/WishlistModel.dart';
import 'package:EsellGlobe/store/theme.dart';

main() => runApp(BootStrapper());

class BootStrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => ProductModel()),
        ChangeNotifierProvider(builder: (context) => UserModel()),
        ChangeNotifierProvider(builder: (context) => CartModel()),
        ChangeNotifierProvider(builder: (context) => WishlistModel()),
        ChangeNotifierProvider(
          builder: (context) => FTheme(),
        )
      ],
      child: EsellApp(),
    );
  }
}

class EsellApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    final theme = Provider.of<FTheme>(context);
    if (user.token == null) user.setLocal();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      home: user.token != null ? HomePageApp() : UserPromptApp(),
    );
  }
}
