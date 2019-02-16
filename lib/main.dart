import 'package:flutter/material.dart';

import './UI/login.dart';
import './UI/register.dart';
import './UI/home.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      routes: {
        "/": (context) => MyLoginForm(),
        "/home": (context) => MyHomePage(),
        "/register": (context) => MyRegisterForm(),
      },
      // home: new MyHomePage(),
    );
  }
}
