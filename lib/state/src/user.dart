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
          if (result == "token expired") {
            delKeyVal("token").then(() {
              _token = null;
              return;
            });
          }
          user = result;
        });
        notifyListeners();
      }
    });
  }
  String _token;
  Map _user;
  String get token => _token;
  Map get user => _user;

  set token(String token) {
    if (token != _token) {
      _token = token;
      notifyListeners();
    }
  }

  set user(Map user) {
    if (user != null && user != _user) {
      _user = user;
      notifyListeners();
    }
  }
}
