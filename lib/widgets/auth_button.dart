import 'package:flutter/material.dart';
import 'package:flutter_app_challenge_yourself/constants.dart';

class AuthButton extends StatelessWidget {
  AuthButton({@required this.title, @required this.onPressed});

  final String title;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
      ),
      onPressed: this.onPressed,
      child: Text(
        this.title,
        style: authButtonTextStyle,
      ),
      color: Colors.redAccent.withOpacity(0.75),
    );
  }
}
