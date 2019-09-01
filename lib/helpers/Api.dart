import './Fetch.dart';
import '../state/state.dart';

final String url = "https://apiesell.herokuapp.com";
String method = "GET";

logout(){
  try{
    delKeyVal("token").then((){
      return "success";
    });
  }catch(err){
    return "failed";
  }
}

login(String email, String password) async {
  try {
    var response = await fetch(uri: '$url/user/login', method: "POST", body: {
      'email': email,
      'password': password,
    });
    if (response['error'] != null) {
      return {"error": response['error']};
    }
    savekeyVal('token', response['token']);
    return {"token": response['token']};
  } catch (err) {
    return {"error": err};
  }
}

signup(String email, String password, String name) async {
  try {
    var response = await fetch(uri: '$url/user/signup', method: "POST", body: {
      'email': email,
      'password': password,
      'name': name,
    });
    return response;
  } catch (err) {
    return {'error': err};
  }
}

getProducts({result = 10, page = 1}) async {
  try {
    var response = await fetch(
      uri: '$url/products?result=$result&page=$page',
    );
    return response['products'];
  } catch (err) {
    return err;
  }
}

getProductsByCategory({category = "top", result = 10, page = 1}) async {
  fetch(
    uri: '$url/products/category/$category?result=$result&page=$page',
  ).then((response) {
    return response['products'];
  });
}

getUser(token) async {
  if (headers['X-Access-Token'] == null) updateAccessToken(token);
  try {
    var response = await fetch(uri: "$url/user");
    return response['result'];
  } catch (err) {
    return err;
  }
}
