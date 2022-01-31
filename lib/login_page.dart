import 'package:app_login_screen/body.dart';
import 'package:app_login_screen/landscape_body.dart';
import 'package:app_login_screen/wind/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final logindata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData) {
            return const HomePage();
          } else if (snapshot.hasError) {
            return const Center(child: Text('Something Went Wrong!'));
          } else {
            return OrientationBuilder(
              builder: (context, orientation) =>
                  orientation == Orientation.portrait
                      ? const Body()
                      : const LandscapeBody(),
            );
          }
        },
      ),
    );
  }
}
