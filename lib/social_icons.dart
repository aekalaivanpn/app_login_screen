import 'package:app_login_screen/provider/google_sign_in.dart';
import 'package:app_login_screen/wind/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_login_screen/color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:twitter_login/twitter_login.dart';

class SocialIcons extends StatefulWidget {
  const SocialIcons({Key? key}) : super(key: key);

  @override
  State<SocialIcons> createState() => _SocialIconsState();
}

class _SocialIconsState extends State<SocialIcons> {
  final logindata = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            FacebookAuth.instance
                .login(permissions: ["public_profile", "email"]).then((value) {
              FacebookAuth.instance.getUserData().then((userData) {
                setState(() {
                  logindata.write('isLoggedIn', true);
                  Get.offAll(() => const HomePage());
                });
              });
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: kPrimaryLightColor,
              ),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'icons/facebook_48.svg',
              height: 25,
              width: 25,
              color: kPrimaryColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: () async {
            await login();
            setState(() {
              logindata.write('isLoggedIn', true);
              Get.offAll(() => const HomePage());
            });
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: kPrimaryLightColor,
              ),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'icons/twitter_48.svg',
              height: 25,
              width: 25,
              color: kPrimaryColor,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            final provider =
                Provider.of<GoogleSignInProvider>(context, listen: false);
            provider.googleLogin();
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(
                width: 2,
                color: kPrimaryLightColor,
              ),
              shape: BoxShape.circle,
            ),
            child: SvgPicture.asset(
              'icons/google_48.svg',
              height: 25,
              width: 25,
              color: kPrimaryColor,
            ),
          ),
        ),
      ],
    );
  }

  Future login() async {
    final twitterLogin = TwitterLogin(
        apiKey: 'xvYtIfjoSSYbRl1Z5A8R8iQ4d',
        apiSecretKey: 'ESdfrOJRwuW0yHXfkA2c1TlJiVfooK4ORbSbJAujRN0C7xrXZj',
        redirectURI:
            'https://app-login-screen-4ef02.firebaseapp.com/__/auth/handler');

    await twitterLogin.login().then((value) async {

      final twitterAuthCredential = TwitterAuthProvider.credential(
          accessToken: value.authToken!,
          secret: value.authTokenSecret!,
      );
      await FirebaseAuth.instance.signInWithCredential(twitterAuthCredential);
    });

  }
}
