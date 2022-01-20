import 'package:flutter/material.dart';
import 'package:app_login_screen/color.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SocialIcons extends StatelessWidget {
  const SocialIcons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {},
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
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
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
            ),
          ),
        ),GestureDetector(
          onTap: () {},
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
            ),
          ),
        ),
      ],
    );
  }
}