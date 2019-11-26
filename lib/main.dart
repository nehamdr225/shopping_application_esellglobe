// import 'package:esell/pages/Home.dart';
import 'package:esell/pages/Home.dart';
import 'package:esell/widget/AnimatingLine.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

Future main() async {
  runApp(BootStrapper(await getValue('token')));
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
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
        ChangeNotifierProvider(builder: (context) => FTheme())
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
      home: token != null ? HomePageApp() : HomePageApp(),
    );
  }
}