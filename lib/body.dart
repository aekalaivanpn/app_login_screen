import 'package:app_login_screen/background.dart';
import 'package:app_login_screen/divider.dart';
import 'package:app_login_screen/input_field.dart';
import 'package:app_login_screen/login_button.dart';
import 'package:app_login_screen/password_field.dart';
import 'package:app_login_screen/signup.dart';
import 'package:app_login_screen/social_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('icons/login.svg',
            width: size.width * 0.6,
            ),
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