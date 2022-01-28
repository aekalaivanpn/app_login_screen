import 'package:app_login_screen/login_page.dart';
import 'package:flutter/material.dart';
import 'package:app_login_screen/color.dart';
import 'package:get/get.dart';

class Login extends StatelessWidget {

  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text(
          "Already have an Account ? ",
          style: TextStyle(
            fontSize: 16,
            color: kPrimaryColor,
          ),
        ),
        GestureDetector(
          onTap: () {
            Get.offAll(() => const LoginPage());
          },
          child: const Text(
            "Login",
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