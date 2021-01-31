import 'package:flutter/material.dart';
import 'package:flutter_app_challenge_yourself/screens/authentification/login.dart';
import 'package:flutter_app_challenge_yourself/screens/authentification/register.dart';
import 'package:flutter_app_challenge_yourself/screens/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
      initialRoute: '/',
    );
  }
}
