import 'package:flutter/cupertino.dart';

class WishlistModel extends ChangeNotifier {
  List<String> _wishList = [];

  get wishList => _wishList;
  set wishList(List<String> products) {
    _wishList.addAll(products);
    notifyListeners();
  }

  one(product) {
    _wishList.add(product);
    notifyListeners();
  }
}
