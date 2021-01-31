import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app_challenge_yourself/constants.dart';
import 'package:flutter_app_challenge_yourself/networking/connection_information.dart';
import 'package:flutter_app_challenge_yourself/widgets/custom_text_field.dart';
import 'package:flutter_app_challenge_yourself/widgets/auth_button.dart';
import 'package:flutter_app_challenge_yourself/widgets/loading.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _loading = false;
  bool _success = true;
  String _message = "";

  void updateLoading(bool loading) {
    setState(() {
      _loading = loading;
    });
  }

  void updateSuccess(bool success) {
    setState(() {
      _success = success;
    });
  }

  void updateMessage(String message) {
    setState(() {
      _message = message;
    });
  }

  void login(String email, String password) async {
    updateLoading(true);

    final response = await http.post(
      ConnectionInformation.url,
      body: {
        "email": email,
        "password": password,
        "entity": "utilisateur",
        "operation": "loginUtilisateur",
      },
    );

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);

      updateSuccess(data['success']);
      updateMessage(data['message']);
      updateLoading(false);
    } else {
      print("Connection refusée");
    }
  }

  CustomTextField emailTextField = CustomTextField(
    title: "Email",
    placeholder: "Enter an email",
    err: "Please complete the email",
  );
  CustomTextField passwordTextField = CustomTextField(
    title: "Password",
    placeholder: "Enter a password",
    err: "Please complete the password",
    isPassword: true,
  );

  // We need the key to verify if our form is filled
  final _key = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return _loading ? Loading() : loginPageContent();
  }

  Widget loginPageContent() {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Form(
                key: _key,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      "Login",
                      textAlign: TextAlign.center,
                      style: loginTextStyle,
                    ),
                    SizedBox(
                      height: 30.0,
                    ),
                    emailTextField.textFormField(),
                    SizedBox(
                      height: 10.0,
                    ),
                    passwordTextField.textFormField(),
                    SizedBox(
                      height: 5.0,
                    ),
                    AuthButton(
                      title: "Login",
                      onPressed: () {
                        if (_key.currentState.validate()) {
                          login(
                            emailTextField.getValue(),
                            passwordTextField.getValue(),
                          );
                        }
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        FlatButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/register');
                          },
                          child: Text(
                            "Register",
                            style: loginOrRegisterButtonTextStyle,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 5.0,
                    ),
                    /*
                    if (!_success)
                      Text(
                        _message,
                        textAlign: TextAlign.center,
                        style: errorTextStyle,
                      ),
                     */
                    if (_message != "")
                      Text(
                        _message,
                        textAlign: TextAlign.center,
                        style: _success == true
                            ? successTextStyle
                            : errorTextStyle,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
