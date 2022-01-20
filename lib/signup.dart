import 'package:flutter/material.dart';
import 'package:app_login_screen/color.dart';

class Signup extends StatelessWidget {

  const Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Don’t have an Account ? ",
          style: TextStyle(
            fontSize: 16,
            color: kPrimaryColor,
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            "Sign Up",
            style: TextStyle(
              fontSize: 16,
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      ],
    );
  }
}