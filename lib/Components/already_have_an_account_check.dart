import 'package:flutter/material.dart';
import 'package:project1/Screens/Login/login_screen.dart';
import 'package:project1/Screens/SignUp/signup_screen.dart';
import 'package:project1/constants.dart';

class AlreadyHaveAnAccountCheck extends StatelessWidget {
  final bool login;
  final Function press;

  const AlreadyHaveAnAccountCheck({
    Key? key,
    this.login = true,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          login ? "Don't have an account ? " : "Already have an account ?",
          style: const TextStyle(color: primaryColor),
        ),
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const LoginScreen();
                },
              ),
            );
          },
          child: Text(
            login ? "Sign Up" : "Sign In",
            style: const TextStyle(
                color: primaryColor, fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
