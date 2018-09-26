import 'package:flutter_sqflite_app/model/user.model.dart';
import 'package:flutter_sqflite_app/services/api.service.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/material.dart';

class LoginController {
  BuildContext ctx;
  ApiService api = ApiService();

  bool isLoggdIn = false;
  void login(String email, String password) async{
//    print('Email: $email');
     try {
       UserModel user = await api.login(email, password);
       print('LoggedIn user : $user');
       SchedulerBinding.instance.addPostFrameCallback((_) {
         Navigator.of(ctx).pushNamed("home");
       });
     } catch (e){
       print('LoggedIn error : $e');

     }
  }

}