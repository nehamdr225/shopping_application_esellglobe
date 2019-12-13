import 'package:esell/core/SecureStorage.dart';
import 'package:esell/core/fetch.dart';
import 'package:esell/core/validators.dart';
import 'package:esell/entities/product.api.dart';
import 'package:esell/entities/user.api.dart';
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
    Fetch _fetch = Fetch();
    CoreSecureStorage _storage = CoreSecureStorage();
    ProductApi _productApi = ProductApi(_fetch);
    UserApi _userApi = UserApi(_fetch, _storage);
    Validator _validator = Validator();

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(builder: (_) => ProductModel(_productApi)),
        ChangeNotifierProvider(
            builder: (_) => UserModel(_userApi, _storage, _validator)),
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
