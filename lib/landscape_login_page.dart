import 'package:app_login_screen/landscape_body.dart';
import 'package:flutter/material.dart';

class LandscapeLoginPage extends StatelessWidget {
  const LandscapeLoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: LandscapeBody(),
    );
  }
}