import 'package:app_login_screen/color.dart';
import 'package:app_login_screen/login_page.dart';
import 'package:app_login_screen/primaryswatch.dart';
import 'package:app_login_screen/provider/google_sign_in.dart';
import 'package:app_login_screen/wind/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();
  await GetStorage.init();
  runApp(const LoginApp());
}

class LoginApp extends StatelessWidget {
  const LoginApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GoogleSignInProvider(),
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Palette.kToDark,
          primaryColor: kPrimaryColor,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: const StartingPage(),
      ),
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
