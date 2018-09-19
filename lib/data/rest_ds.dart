import 'dart:async';

import 'package:flutter_sqflite_app/model/user.dart';
import 'package:flutter_sqflite_app/utils/network_util.dart';


class RestDataSource {
  static final BASE_URL = "https://rp-gateway.herokuapp.com";
  static final LOGIN_URL = BASE_URL + "/auth/v1/users/login";

//  static final _API_KEY = "somerendomkey";

  Future<User> login(String email, String password) async {
    final data = await NetworkUtil.instance.post(LOGIN_URL, body: {
//      "token": _API_KEY,
      "email": "email",
      "password": "password"
    });
    if (data.containsKey('error')) {
      throw Exception(data['error_msg']);
    }
    if (!data.containsKey('user')) {
      throw Exception('User missing');
    }
    return User.map(Map.from(data['user']));
  }
}