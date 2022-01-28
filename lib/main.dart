import 'package:app_login_screen/color.dart';
import 'package:app_login_screen/login_page.dart';
import 'package:app_login_screen/primaryswatch.dart';
import 'package:app_login_screen/wind/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

void main() async {
  await GetStorage.init();
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Palette.kToDark,
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const StartingPage(),
      // home: OrientationBuilder(
      //     builder: (context, orientation) =>
      //         orientation == Orientation.portrait
      //             ? const SignupPage()
      //             : const LandscapeSignupPage(),
      // ),
    );
  }
}

class StartingPage extends StatefulWidget {
  const StartingPage({Key? key}) : super(key: key);

  @override
  _StartingPageState createState() => _StartingPageState();
}

class _StartingPageState extends State<StartingPage> {
  final logindata = GetStorage();

  @override
  void initState() {
    super.initState();

    logindata.writeIfNull('isLoggedIn', false);

    Future.delayed(Duration.zero, () async {
      checkifloggedin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }

  void checkifloggedin() {
    logindata.read('isLoggedIn')
        ? Get.offAll(() => const HomePage())
        : Get.offAll(() => const LoginPage());
  }

}
