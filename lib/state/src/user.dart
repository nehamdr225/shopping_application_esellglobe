import 'package:esell/helpers/Api.dart';
// import 'package:esell/helpers/Fetch.dart';
import 'package:esell/state/state.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  UserModel() {
    getValue('token').then((token) {
      if (token != null && token != _token) {
        _token = token;
        getUser(token).then((result) {
          if (result['error'] == null) {
            if (result['message'] == "Auth failed") {
              delKeyVal("token").then((data) {
                _token = null;
                notifyListeners();
              });
            } else if (result['result']['cart'] != null) {
              getCart(token).then((data) {
                if (data['error'] == null) _cart = data['result']['products'];
                notifyListeners();
              });
            }
            user = result['result'];
            notifyListeners();
          }
        });
      }
    });
  }

  String _token;
  Map _user;
  List<String> _wishList = [];
  List _cart = [];

  String get token => _token;
  set token(String token) {
    if (token != _token) {
      _token = token;
      notifyListeners();
    }
  }

  Map get user => _user;
  set user(Map user) {
    if (user != null && user != _user) {
      _user = user;
      notifyListeners();
    }
  }

  get cart => _cart;
  set cart(items) => _cart = items;
  addToCart(String product, qty, size, color) {
    if (user['cart'] == null) {
      registerCart(token, product, qty ?? 1, size, color).then((data) {
        if (data['error'] == null) {
          _cart.add(product);
          _user.addAll({'cart': data['result']['_id']});
          notifyListeners();
          return "success";
        }
        return "failed";
      });
    } else
      updateCart(token, product, qty ?? 1, size, color).then((result) {
        if (result['error'] == null) {
          _cart.add(product);
          notifyListeners();
          return "success";
        }
        return "failed";
      });
  }

  findCartItem(id) {
    return _cart.contains(id);
  }

  deleteFromCart(id) {
    deleteCartItem(token, id).then((data) {
      print(data);
      if (data['error'] == null) {
        _cart.removeWhere((each) => each['product'] == id);
        notifyListeners();
        return "done";
      }
      return "failed";
    });
  }

  get wishList => _wishList;
  addToWishList(String product) {
    print(product);
    _wishList.add(product);
    notifyListeners();
  }

  findWishlistItem(id) {
    if (_wishList.length == 0) return false;
    return _wishList.contains(id);
  }
}
