import 'package:app_login_screen/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:app_login_screen/color.dart';
import 'package:get/get.dart';

class Signup extends StatefulWidget {

  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
          onTap: () {
            Get.offAll(() => const SignupPage());
          },
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