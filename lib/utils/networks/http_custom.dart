import 'dart:convert';

import 'package:http/http.dart' as http;

abstract class MobileHttpClient {
  Future<dynamic> get({required String path, String? token});
  Future<dynamic> post(
      {required String path,
      required String body,
      String? token,
      Map<String, String>? header});
  Future<dynamic> put(
      {required String path, required String body, String? token});
  Future<dynamic> delete({required String path, String? token});
}

class CustomHttp implements MobileHttpClient {
  _header(String token) {
    Map<String, String> headers = {
      'Content-type': 'application/json',
      'Authorization': 'Bearer $token',
    };
    return headers;
  }

  _response(http.Response response) {
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  late http.Response response;

  @override
  Future delete({required String path, String? token}) async {
    response = await http.delete(Uri(path: path), headers: _header(token!));
    return _response(response);
  }

  @override
  Future get({required String path, String? token}) async {
    response = await http.get(Uri(path: path), headers: _header(token!));

    return _response(response);
  }

  @override
  Future post({
    required String path,
    required String body,
    String? token,
    Map<String, String>? header,
  }) async {
    response = await http.post(Uri(path: path), body: body, headers: header);
    return _response(response);
  }

  @override
  Future put({required String path,required String body, String? token}) async {
    response = await http.put(Uri(path: path), body: body, headers: _header(token!));
    return _response(response);
  }
}
