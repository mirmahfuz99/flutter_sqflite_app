import 'package:flutter_sqflite_app/data/rest_ds.dart';
import 'package:flutter_sqflite_app/model/user.dart';

abstract class LoginScreenContract {
  void onLoginSuccess(User user);

  void onLoginError(String errorTxt);
}

class LoginScreenPresenter {
  LoginScreenContract _view;
  RestDataSource api = RestDataSource();

  LoginScreenPresenter(this._view);

  void doLogin(String email, String password) async {
    try {
      User user = await api.login(email, password);
      _view.onLoginSuccess(user);
    }
    catch (error, stackTrace) {
      print('Error $error\n$stackTrace');
      _view.onLoginError(error.toString());
    }
  }
}