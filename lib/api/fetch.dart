import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:dio_flutter_transformer/dio_flutter_transformer.dart';
import 'package:http/http.dart' as http;

const JSON_TYPE = {'content-type': 'application/json'};
const Map<String, String> Error = {"error": "Error with network!"};

Dio getDioInstance() {
  final Dio dio = Dio();
  dio.transformer = FlutterTransformer();
  return dio;
}

class Fetch {
  Future<Response<T>> get<T>({
    String url,
    String token,
  }) async {
    try {
      final dio = getDioInstance();
      return await dio.get(
        url,
        options: Options(
          headers: {...JSON_TYPE, if (token != null) "X-Access-Token": token},
          responseType: ResponseType.json,
          validateStatus: (status) => true,
        ),
      );
    } catch (e) {
      throw DioError(error: e);
    }
  }

  Future<Response<T>> post<T>({
    String url,
    String token,
    dynamic data,
  }) async {
    try {
      final dio = getDioInstance();
      return await dio.post(
        url,
        options: Options(
          headers: {...JSON_TYPE, if (token != null) "X-Access-Token": token},
          responseType: ResponseType.json,
          validateStatus: (status) => true,
        ),
        data: data,
      );
    } catch (e) {
      print(e);
      throw DioError(error: e);
    }
  }

  Future<Response<T>> put<T>({
    String url,
    String token,
    dynamic data,
  }) async {
    try {
      final dio = getDioInstance();
      return await dio.put(
        url,
        options: Options(
          headers: {...JSON_TYPE, if (token != null) "X-Access-Token": token},
          responseType: ResponseType.json,
          validateStatus: (status) => true,
        ),
        data: data,
      );
    } catch (e) {
      print(e);
      throw DioError(error: e);
    }
  }

  Future<Response<T>> delete<T>({
    String url,
    String token,
    dynamic data,
  }) async {
    try {
      final dio = getDioInstance();
      return await dio.delete(
        url,
        options: Options(
          headers: {...JSON_TYPE, if (token != null) "X-Access-Token": token},
          responseType: ResponseType.json,
          validateStatus: (status) => true,
        ),
        data: data,
      );
    } catch (e) {
      throw DioError(error: e);
    }
  }
}
