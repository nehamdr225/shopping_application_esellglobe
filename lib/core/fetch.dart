import 'dart:convert';
import 'package:http/http.dart' as http;

const Map<String, String> DefaultHeaders = {"Content-Type": "application/json"};
const Map<String, String> Error = {"error": "Error with network!"};

class Fetch {
  Future get({String url, Map headers}) async {
    try {
      var response = await http.get(url, headers: headers ?? DefaultHeaders);
      return json.decode(response.body);
    } catch (e) {
      return Error;
    }
  }

  Future post({String url, Map headers, Map body}) async {
    try {
      var response = await http.post(
        url,
        headers: headers ?? DefaultHeaders,
        body: json.encode(body ?? ''),
      );
      return json.decode(response.body);
    } catch (e) {
      return Error;
    }
  }

  Future put({String url, Map headers, Map body}) async {
    try {
      var response = await http.put(
        url,
        headers: headers ?? DefaultHeaders,
        body: json.encode(body),
      );
      return json.decode(response.body);
    } catch (e) {
      return Error;
    }
  }

  Future delete({String url, Map headers, Map body}) async {
    try {
      var response = await http.delete(url, headers: headers ?? DefaultHeaders);
      return json.decode(response.body);
    } catch (e) {
      return Error;
    }
  }
}
