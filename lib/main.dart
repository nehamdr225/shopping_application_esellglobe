import 'package:esell/core/SecureStorage.dart';
import 'package:esell/core/fetch.dart';
import 'package:esell/core/validators.dart';
import 'package:esell/entities/product.api.dart';
import 'package:esell/entities/user.api.dart';
import 'package:esell/pages/Home.dart';
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
        ChangeNotifierProvider(
            create: (_) => new ProductModel(ProductApi(Fetch()))),
        ChangeNotifierProvider(
            create: (_) => new UserModel(UserApi(Fetch(), CoreSecureStorage()),
                CoreSecureStorage(), Validator())),
        ChangeNotifierProvider(create: (_) => new FTheme())
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
