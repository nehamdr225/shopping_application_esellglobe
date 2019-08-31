import 'package:flutter/cupertino.dart';

class WishlistModel extends ChangeNotifier {
  List<String> _wishList = [];

  get wishList => _wishList;
  count() => _wishList.length;

  set wishList(List<String> products) {
    _wishList.addAll(products);
    notifyListeners();
  }

  set setOne (id) => _wishList.add(id);

  find(id) {
    return _wishList.contains(id);
  }

  one(id) {
    _wishList.add(id);
    notifyListeners();
  }
}
