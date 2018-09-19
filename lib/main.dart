import 'package:flutter/material.dart';
import 'package:flutter_sqflite_app/screens/home/home_screen.dart';
import 'package:flutter_sqflite_app/screens/login/login_screen.dart';

void main() => runApp(new MyApp());


class MyApp extends StatelessWidget {


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'My Login App',

      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      routes: {
        '/': (BuildContext context) => new LoginScreen(),
        '/login': (BuildContext context) => new LoginScreen(),
        '/home': (BuildContext context) => new HomeScreen(),

      },
    );
  }


}