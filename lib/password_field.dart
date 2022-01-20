import 'package:app_login_screen/text_field.dart';
import 'package:flutter/material.dart';
import 'package:app_login_screen/color.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({Key? key}) : super(key: key);

  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {

  bool _isHidden = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        obscureText: _isHidden,
        onChanged: (value) {},
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: "Password",
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: InkWell(
            onTap: _togglePasswordView,
            child: Icon(
              _isHidden
              ? Icons.visibility
              : Icons.visibility_off,
              color: kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  void _togglePasswordView() {

    setState(() {
      _isHidden = !_isHidden;
    });
  }
}