
import 'package:flutter/material.dart';
import 'package:flutter_sqflite_app/screens/home/home_screen.dart';
import 'package:flutter_sqflite_app/screens/login/login_screen.dart';

void main() => runApp(new MyApp());

final routes = {
  
  '/login': (BuildContext context) => new LoginScreen(),
  '/home': (BuildContext context) => new HomeScreen(),
  '/': (BuildContext context) => new LoginScreen(),
  
};

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sqflite App',
      theme: new ThemeData(primarySwatch: Colors.teal),
      routes: routes,
    );
  }
}