// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_register/controller/authcontroller.dart';
import 'package:test_register/setup/constant.dart';

class TextForm extends StatelessWidget {
  final AuthController authController = Get.put(AuthController());

  final String labelText;
  final String hintText;
  final VoidCallback press;
  final Icon icon;
  final bool obscureText;
  final TextEditingController controller;

  TextForm({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.press,
    required this.obscureText,
    required this.controller,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          labelText: labelText,
          hintText: hintText,
          suffixIcon: Padding(
              padding: EdgeInsets.only(right: 5),
              child: IconButton(
                onPressed: press,
                icon: icon,
              )),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(width: 1.5, color: color1.withOpacity(0.5)),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(width: 1.5, color: color1))),
    );
  }
}
