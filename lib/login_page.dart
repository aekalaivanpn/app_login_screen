import 'package:app_login_screen/body.dart';
import 'package:app_login_screen/landscape_body.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(
        builder: (context, orientation) => orientation == Orientation.portrait
            ? const Body()
            : const LandscapeBody(),
      ),
    );
  }
}
