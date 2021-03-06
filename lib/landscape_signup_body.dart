import 'package:app_login_screen/divider.dart';
import 'package:app_login_screen/input_field.dart';
import 'package:app_login_screen/landscape_background.dart';
import 'package:app_login_screen/login.dart';
import 'package:app_login_screen/password_field.dart';
import 'package:app_login_screen/register_button.dart';
import 'package:app_login_screen/social_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandscapeSignupBody extends StatelessWidget {
  const LandscapeSignupBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return LandscapeBackground(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SvgPicture.asset('icons/signup.svg',
              width: size.width * 0.2,
            ),
            InputField(
              hintText: "User Name",
              onChanged: (value) {},
              icon: Icons.person,
            ),
            InputField(
              hintText: "e-mail",
              onChanged: (value) {},
              icon: Icons.email_outlined,
            ),
            const PasswordField(
              hintText: "Password",
            ),
            const PasswordField(
              hintText: "Confirm Password",
            ),
            InputField(
              hintText: "Phone No",
              onChanged: (value) {},
              icon: Icons.phone_android_rounded,
            ),
            InputField(
              hintText: "First Name",
              onChanged: (value) {},
              icon: Icons.person_add,
            ),
            InputField(
              hintText: "Last Name",
              onChanged: (value) {},
              icon: Icons.person_add,
            ),
            const RegisterButton(),
            const Login(),
            const OrDivider(),
            const SocialIcons(),
          ],
        ),
      ),
    );
  }
}