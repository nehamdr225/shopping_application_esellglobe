import 'dart:convert';
import 'package:http/http.dart' as http;

class Client {
  
  final String url;
  String method, resource;

  Client({
    this.url: "https://apiesell.herokuapp.com",
    this.method: "GET",
    this.resource: "/products",
  });

  login(String email, String password) async {
    try {
      var response = await http.post(url + '/user/login', headers: {
        'Content-Type': 'application/json',
      }, body: {
        'email': email,
        'password': password,
      });

      return json.decode(response.body).token;
    } catch (err) {
      return err;
    }
  }

  signup(String email, String password, String name) async {
    try {
      var response = await http.post(url + '/user/signup', headers: {
        'Content-Type': 'application/json',
      }, body: {
        'email': email,
        'password': password,
        'name': name,
      });

      return json.decode(response.body).message;
    } catch (err) {
      return err;
    }
  }

  
}
