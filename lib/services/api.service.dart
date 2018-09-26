import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_sqflite_app/model/user.model.dart';


class ApiService {
  static final BASE_URL = "https://rp-gateway.herokuapp.com";
  static final LOGIN_URL = BASE_URL + "/auth/v1/users/login";


  Future<UserModel> login(String email, String password) async {
    try {
      final response = await http.post(LOGIN_URL, body: {
        "email": email,
        "password": password
      });


      print('response: -' + json.decode(response.body));
      final user = UserModel.fromJson(json.decode(response.body));
      if (user.status) {
        print('print from service: $user');
        return user;
      } else {
        print('print error from service: $user');
        throw (user.message);
      }
    } catch (e) {
      print('print err, from service: $e');
      throw (e.toString());
    }
  }

}