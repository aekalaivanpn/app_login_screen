import 'package:app_login_screen/text_field.dart';
import 'package:flutter/material.dart';
import 'package:app_login_screen/color.dart';

class InputField extends StatelessWidget {

  const InputField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      child: TextField(
        onChanged: (value) {},
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          icon: Icon(
            Icons.person,
            color: kPrimaryColor,
          ),
          hintText: 'User Name',
          border: InputBorder.none,
        ),
      ),
    );
  }
}