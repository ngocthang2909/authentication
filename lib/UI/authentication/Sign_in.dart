// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, file_names, prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:test_register/UI/home/home_screen.dart';
import 'package:test_register/components/Remember.dart';
import 'package:test_register/components/button.dart';
import 'package:test_register/components/textform.dart';
import 'package:test_register/controller/authcontroller.dart';
import 'package:test_register/controller/boolcontroller.dart';

import 'package:test_register/setup/constant.dart';

class SignIn extends StatelessWidget {
  SignIn({Key? key}) : super(key: key);
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final BoolController boolController = Get.put(BoolController());
    final AuthController authController = Get.put(AuthController());
    return Scaffold(
      backgroundColor: color3,
      appBar: AppBar(
        title: Text(
          'Sign in',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              SizedBox(height: 120),
              Column(
                children: [
                  Form(
                    child: Column(children: [
                      TextForm(
                          controller: emailController,
                          labelText: 'Email',
                          hintText: 'Enter your email',
                          press: () {},
                          obscureText: false,
                          icon: Icon(Icons.email_rounded)),
                      SizedBox(height: 20),
                      GetBuilder<BoolController>(
                          init: boolController,
                          builder: (context) {
                            return TextForm(
                              controller: passwordController,
                              labelText: 'Password',
                              hintText: 'At least 8 characters',
                              obscureText: !boolController.isVisible,
                              icon: !boolController.isVisible
                                  ? Icon(Icons.visibility_off)
                                  : Icon(Icons.visibility),
                              press: () {
                                boolController.changeVisible();
                              },
                            );
                          }),
                    ]),
                  ),
                  SizedBox(height: 20),
                  RowRemember(),
                  SizedBox(height: 100),
                  BottomButton(
                    press: () {
                      authController.signIn(
                          emailController.text, passwordController.text);
                      Get.to(() => HomeScreen());
                    },
                    color: color1,
                    text: 'Continue',
                    textColor: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 30),
              Text('or sign in with',
                  style:
                      TextStyle(fontSize: 14, color: color1.withOpacity(0.5))),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSocialButton(
                      child: SvgPicture.asset('assets/icons/facebook-2.svg')),
                  buildSocialButton(
                      child: SvgPicture.asset('assets/icons/google-icon.svg')),
                  buildSocialButton(
                      child: SvgPicture.asset('assets/icons/twitter.svg')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildSocialButton({required Widget child}) {
  return Container(
    height: 55,
    width: 55,
    decoration: BoxDecoration(
      shape: BoxShape.circle,
      color: color4,
    ),
    child: Padding(
      padding: EdgeInsets.all(15),
      child: child,
    ),
  );
}
