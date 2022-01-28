import 'package:flutter/material.dart';

class LandscapeBackground extends StatelessWidget {

  final Widget child;
  const LandscapeBackground({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: SafeArea(
        top: true,
        bottom: false,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              top: 0,
              left: 0,
              child: Image.asset('images/top.png',
                width: size.width * 0.3,
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Image.asset('images/bottom.png',
                width: size.width * 0.3,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}