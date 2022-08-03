import 'package:flutter/material.dart';
import 'package:project1/Components/already_have_an_account_check.dart';
import 'package:project1/Components/rounded_button.dart';
import 'package:project1/Components/rounded_input_field.dart';
import 'package:project1/Components/rounded_password_field.dart';
import 'package:project1/constants.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        widthFactor: double.infinity,
        heightFactor: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            // ignore: prefer_const_constructors
            Text(
              "Login",
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Enter Email",
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(text: "LOGIN", press: () {}, color: primaryColor),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}
