import 'package:EsellGlobe/store/Store.dart';
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

main() async {
  final token = await getValue('token');
  runApp(BootStrapper(token));
}

class BootStrapper extends StatelessWidget {
  final token;
  BootStrapper(this.token);
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
      child: EsellApp(token),
    );
  }
}

class EsellApp extends StatelessWidget {
  final token;
  EsellApp(this.token);
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<FTheme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      home: token != null ? HomePageApp() : UserPromptApp(),
    );
  }
}
