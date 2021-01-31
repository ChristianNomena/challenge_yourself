import 'package:flutter/material.dart';
import 'package:flutter_app_challenge_yourself/constants.dart';

class CustomTextField {
  CustomTextField(
      {@required this.title,
      @required this.placeholder,
      this.isPassword = false,
      this.err = "Please complete this field"});

  final String title;
  final String placeholder;
  final bool isPassword;
  final String err;
  String _value;
  TextEditingController controller = TextEditingController();

  TextFormField textFormField() {
    return TextFormField(
      controller: controller,
      onChanged: (e) {
        _value = e;
      },
      validator: (e) => e.isEmpty ? this.err : null,
      obscureText: this.isPassword,
      decoration: InputDecoration(
        hintText: this.placeholder,
        labelText: this.title,
        labelStyle: customTextFieldLabelTextStyle,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(5.0),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.redAccent,
          ),
        ),
      ),
    );
  }

  String getValue() => _value;
}
