import 'dart:convert';
import 'package:http/http.dart' as http;

class Client {
  final String url;
  String method, resource;
  Map <String, String> headers = {
        'Content-Type': 'application/json',
      };

  Client({
    this.url: "https://apiesell.herokuapp.com",
    this.method: "GET",
    this.resource: "/products",
  });


  updateAccessToken(token) async {
    try{
      headers.addAll({'X-Access-Token': token});
    }catch(err){
      throw err;
    }
  }

  login(String email, String password) async {
    try {
      var response = await fetch(uri:'$url/user/login', method: "POST", body: {
        'email': email,
        'password': password,
      });

      return response.token;
    } catch (err) {
      return err;
    }
  }

  signup(String email, String password, String name) async {
    try {
      var response = await fetch(uri:'$url/user/signup', method: "POST", body: {
        'email': email,
        'password': password,
        'name': name,
      });

      return response.message;
    } catch (err) {
      return err;
    }
  }

  getProducts({result:10, page:1}) async {
    try{
      var response = await fetch(uri:'$url/products/result=$result&page=$page');
      return response.products;
    }catch(err){
      return err;
    }
  }

  getUser(id) async {
    try{
      var response = await fetch(uri:"$url/user");
      return response.result;
    }catch(err){
      return err;
    }
  }

  fetch({uri, method:"GET", body:''}) async {
    try{
    switch(method){
      case "GET":
        var response = await http.get(uri, headers: headers);
        return json.decode(response.body);
      case "POST":
        var response = await http.post(uri, headers: headers, body: body);
        return json.decode(response.body);
      case "PUT":
        var response = await http.put(uri, headers: headers, body: body);
        return json.decode(response.body);
      default:
        var response = await http.get(uri, headers: headers);
        return json.decode(response.body);
    }
    }catch(err){
      throw err;
    }
  }
}
