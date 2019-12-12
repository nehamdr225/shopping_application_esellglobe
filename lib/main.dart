import 'package:esell/pages/Home.dart';
// import 'package:esell/pages/CheckoutPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:esell/state/state.dart';

Future main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Color(0xff3288a6),
  ));
  runApp(BootStrapper());
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
}

class BootStrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => ProductModel()),
        ChangeNotifierProvider(builder: (_) => UserModel()),
        ChangeNotifierProvider(builder: (_) => FTheme())
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
