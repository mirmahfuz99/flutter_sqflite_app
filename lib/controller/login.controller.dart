import 'package:flutter_sqflite_app/model/user.model.dart';
import 'package:flutter_sqflite_app/services/api.service.dart';
import 'package:flutter/material.dart';

class LoginController {
//  BuildContext ctx;
  ApiService api = ApiService();
  BuildContext context;

  bool isLoggdIn = false;
  void login(String email, String password) async{
      await api.login(email, password).then((user){
        print('LoggedIn user : $user');
        UserModel model = user;
        print(model.data['access_token']);
        print(model.status);
        if(user.status){
//          Navigator.of(context).pushReplacement("/home");
        } else {

        }
      }).catchError((e){
        print(e);
      });
  }

}