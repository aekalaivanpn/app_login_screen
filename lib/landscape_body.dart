import 'package:app_login_screen/divider.dart';
import 'package:app_login_screen/input_field.dart';
import 'package:app_login_screen/landscape_background.dart';
import 'package:app_login_screen/login_button.dart';
import 'package:app_login_screen/password_field.dart';
import 'package:app_login_screen/signup.dart';
import 'package:app_login_screen/social_icons.dart';
import 'package:flutter/material.dart';

class LandscapeBody extends StatelessWidget {
  const LandscapeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LandscapeBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset('images/center.png',
                width: size.width * 0.2),
            InputField(
              hintText: "User Name",
              onChanged: (value) {},
              icon: Icons.person,
            ),
            const PasswordField(
              hintText: "Password",
            ),
            const LoginButton(),
            const Signup(),
            const OrDivider(),
            const SocialIcons(),
          ],
        ),
      ),
    );
  }
}