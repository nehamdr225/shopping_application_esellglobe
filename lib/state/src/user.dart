import 'package:esell/state/state.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  String _token, _id, _name;

  String get token => _token;
  String get id => _id;
  String get name => _name;

  set token(String token) {
    if (token != null && token != _token) {
      _token = token;
      notifyListeners();
    }
  }

  set id(String id) {
    if (id != null && id != _id) {
      _id = id;
      notifyListeners();
    }
  }

  set name(String name) {
    if (name != null && name != _name) {
      _name = name;
      notifyListeners();
    }
  }

  UserModel() {
    getValue('token').then((token) {
      if (token != null && token != _token) {
        _token = token;
        notifyListeners();
      }
    });
  }
}
