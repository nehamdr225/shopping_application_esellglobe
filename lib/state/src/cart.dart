import 'package:flutter/cupertino.dart';

class CartModel extends ChangeNotifier {
  List _cart = [];

  get cart => _cart;
  get count => _cart.length;

  set cart(List ids) {
    _cart.addAll(ids);
    notifyListeners();
  }

  find(id) {
    return _cart.contains(id);
  }

  one(product) {
    _cart.add(product);
    notifyListeners();
  }
}

// removeFromCart(String id) {
//     if (id != null && id.length > 0 && .length > 0) {
//       deleteFavourites(id, token).then((response) {
//         if (response["result"] != null) {
//           if (favourites.contains(id)) state["favourites"].remove(id);
//           notifyListeners();
//           return response;
//         }
//       });
//     }
//   }
