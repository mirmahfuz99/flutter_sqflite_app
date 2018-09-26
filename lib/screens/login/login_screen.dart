import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_sqflite_app/controller/login.controller.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen>{
  BuildContext ctx;

  bool isLoading = false;
  final formKey = new GlobalKey<FormState>();
  final scaffoldKey = new GlobalKey<ScaffoldState>();
  String _password, _email;

  LoginController loginCtrl;
  LoginScreenState() {
    loginCtrl = new LoginController();
  }

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      setState(() => isLoading = true);
      form.save();
      loginCtrl.login(_email, _password);
    }
  }

  @override
  Widget build(BuildContext context) {
    ctx = context;
    var loginBtn = new RaisedButton(
      onPressed: _submit,
      child: new Text("LOGIN"),
      color: Colors.primaries[0],
    );
    var loginForm = new Column(
      children: <Widget>[
        new Text(
          "Login App",
          textScaleFactor: 2.0,
        ),
        new Form(
          key: formKey,
          child: new Column(
            children: <Widget>[
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  onSaved: (val) => _email = val,
                  validator: (val) {
                    return val.length < 10
                        ? "Username must have atleast 10 chars"
                        : null;
                  },
                  decoration: new InputDecoration(labelText: "Username"),
                ),
              ),
              new Padding(
                padding: const EdgeInsets.all(8.0),
                child: new TextFormField(
                  onSaved: (val) => _password = val,
                  decoration: new InputDecoration(labelText: "Password"),
                ),
              ),
            ],
          ),
        ),
        isLoading ? new CircularProgressIndicator() : loginBtn
      ],
      crossAxisAlignment: CrossAxisAlignment.center,
    );

    return new Scaffold(
      appBar: null,
      key: scaffoldKey,
      body: new Container(
        
        child: new Center(
          child: new ClipRect(
            child: new BackdropFilter(
              filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: new Container(
                child: loginForm,
                height: 300.0,
                width: 300.0,
                decoration: new BoxDecoration(
                    color: Colors.grey.shade200.withOpacity(0.5)),
              ),
            ),
          ),
        ),
      ),
    );
  }

//  @override
//  void onLoginError(String errorTxt) {
//    _showSnackBar(errorTxt);
//    setState(() => isLoading = false);
//  }
//
//  @override
//  void onLoginSuccess(User user) async {
//    _showSnackBar(user.toString());
//    setState(() => isLoading = false);
//     Navigator.of(context).pushNamed("/home");
//    var authStateProvider = new AuthStateProvider();
//    authStateProvider.notify(AuthState.LOGGED_IN);
//  }
}