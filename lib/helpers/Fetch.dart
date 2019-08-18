import 'dart:convert';
import 'package:http/http.dart' as http;

Map<String, String> headers = {
  'Content-Type': 'application/json',
};


fetch({uri, method: "GET", body: ''}) async {
  try {
    switch (method) {
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
  } catch (err) {
    throw err;
  }
}

updateAccessToken(token) async {
  try {
    headers['X-Access-Token'] = token;
  } catch (err) {
    throw err;
  }
}
