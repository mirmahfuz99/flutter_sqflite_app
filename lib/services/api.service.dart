import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_sqflite_app/model/user.model.dart';


class ApiService {
  static final BASE_URL = "https://rp-gateway.herokuapp.com";
  static final LOGIN_URL = BASE_URL + "/auth/v1/users/login";


  Future<UserModel> login(String email, String password)  async {
    UserModel model;

     await http.post(LOGIN_URL, body: {
        "email": email,
        "password": password
      }).then((res) {
        model = UserModel.fromJson(jsonDecode(res.body));
        print('response from service');
        print(model);

     }).catchError((e){
       print('print err, from service: $e');
       throw (e.toString());
     });


    return model != null?  model: 'noData';
  }

}