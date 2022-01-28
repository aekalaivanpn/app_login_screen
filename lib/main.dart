import 'package:app_login_screen/color.dart';
import 'package:app_login_screen/login_page.dart';
import 'package:app_login_screen/landscape_login_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: OrientationBuilder(
          builder: (context, orientation) =>
              orientation == Orientation.portrait
                  ? const LoginPage()
                  : const LandscapeLoginPage(),
      ),
    );
  }
}
