// import 'package:esell/pages/Home.dart';
import 'package:esell/pages/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

Future main() async {
  runApp(BootStrapper());
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class BootStrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (context) => ProductModel()),
        ChangeNotifierProvider(builder: (context) => UserModel()),
        ChangeNotifierProvider(builder: (context) => CartModel()),
        ChangeNotifierProvider(builder: (context) => WishlistModel()),
        ChangeNotifierProvider(builder: (context) => FTheme())
      ],
      child: EsellApp(),
    );
  }
}

class EsellApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<FTheme>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme.getTheme(),
      home: HomePageApp(),
    );
  }
}
