import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


class NetworkUtil {
  NetworkUtil._();

  static final NetworkUtil instance = NetworkUtil._();

  Future<Map<String, dynamic>> get(String url) {
    return http.get(url).then((http.Response response) {
      final int statusCode = response.statusCode;
      if (statusCode < 200 || statusCode > 400 || json == null) {
        throw new Exception("Error while fetching data");
      }

      return json.decode(response.body);
    });
  }

  Future<Map<String, dynamic>> post(String url, {Map headers, body, encoding}) async {
    http.Response response = await http.post(url,
      body: body,
      headers: headers,
      encoding: encoding,
    );
    print('response: ${response.body}');

    final int statusCode = response.statusCode;
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }

    return json.decode(response.body);
  }
}