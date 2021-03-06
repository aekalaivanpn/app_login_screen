import 'package:app_login_screen/wind/home_page.dart';
import 'package:flutter/material.dart';
import 'package:app_login_screen/color.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginButton extends StatefulWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  State<LoginButton> createState() => _LoginButtonState();
}

class _LoginButtonState extends State<LoginButton> {

  final logindata = GetStorage();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      child: const Text(
        'LOGIN',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {
        logindata.write('isLoggedIn', true);
        Get.offAll(() => const HomePage());
      },
      style: ElevatedButton.styleFrom(
          primary: kPrimaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
          textStyle: const TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
          )),
    );
  }
}
