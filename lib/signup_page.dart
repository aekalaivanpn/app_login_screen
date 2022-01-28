import 'package:app_login_screen/landscape_signup_body.dart';
import 'package:app_login_screen/signup_body.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? const SignupBody()
            : const LandscapeSignupBody(),
      ),
    );
  }
}
