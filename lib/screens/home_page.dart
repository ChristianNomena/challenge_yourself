import 'package:flutter/material.dart';
import 'package:flutter_app_challenge_yourself/screens/authentification/login.dart';
import 'package:flutter_app_challenge_yourself/screens/authentification/register.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return LoginPage();
  }
}
