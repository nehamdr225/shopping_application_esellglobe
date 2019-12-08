import 'dart:convert';
import 'package:http/http.dart' as http;

const Map<String, String> DefaultHeaders = {"Content-Type": "application/json"};

fetch({uri, method: "GET", body, Map<String, String> headers}) async {
  try {
    switch (method) {
      case "GET":
        var response = await http.get(uri, headers: headers ?? DefaultHeaders);
        return json.decode(response.body);
      case "POST":
        var response = await http.post(uri,
            headers: headers, body: json.encode(body ?? ''));
        return json.decode(response.body);
      case "PUT":
        var response = await http.put(uri,
            headers: headers, body: json.encode(body ?? ''));
        return json.decode(response.body);
      case "DELETE":
        var response = await http.delete(uri, headers: headers);
        return json.decode(response.body);
      default:
        var response = await http.get(uri, headers: headers);
        return json.decode(response.body);
    }
  } catch (err) {
    return {"error": err};
  }
}
