import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

Map<String, String> headers = {
  HttpHeaders.contentTypeHeader: 'application/json',
};


fetch({uri, method: "GET", body: ''}) async {
  print("called");
  try {
    print(uri);
    switch (method) {
      case "GET":
        var response = await http.get(uri, headers: headers);
        return json.decode(response.body);
      case "POST":
        var response =
            await http.post(uri, headers: headers, body: json.encode(body));
        if (response.statusCode <= 400)
          return json.decode(response.body);
        else
          return {"error": "A problem occured while registering User"};
        break;
      case "PUT":
        var response =
            await http.put(uri, headers: headers, body: json.encode(body));
        return json.decode(response.body);
      default:
        var response = await http.get(uri, headers: headers);
        return json.decode(response.body);
    }
  } catch (err) {
    return {"error": err};
  }
}

updateAccessToken(token) async {
  try {
    headers['X-Access-Token'] = token;
  } catch (err) {
    throw err;
  }
}
