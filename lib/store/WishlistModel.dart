import 'package:flutter/cupertino.dart';

class WishlistModel extends ChangeNotifier {
  List<String> _wishList = [];

  get wishList => _wishList;
  set wishList(List<String> product) {
    _wishList.addAll(product);
    notifyListeners();
  }
}
