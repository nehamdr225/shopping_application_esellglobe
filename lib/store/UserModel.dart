import 'package:flutter/cupertino.dart';

class UserModel extends ChangeNotifier {
  String _token, _id, _name;

  String get token => _token;
  String get id => _id;
  String get name => _name;

  set token(String token) {
    _token = token;
    // notifyListeners();
  }

  set id(String id) {
    _id = id;
    notifyListeners();
  }

  set name(String name) {
    _name = name;
    notifyListeners();
  }
}
