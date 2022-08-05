import 'package:flutter/material.dart';
import 'package:project1/Components/already_have_an_account_check.dart';
import 'package:project1/Components/rounded_button.dart';
import 'package:project1/Components/rounded_input_field.dart';
import 'package:project1/Components/rounded_password_field.dart';
import 'package:project1/Screens/Home/home_screen.dart';
import 'package:project1/Screens/Login/login_screen.dart';
import 'package:project1/constants.dart';
import 'package:project1/models/user.dart';
import 'package:project1/services/signup_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  User? user;
  String email = "";
  String emailInput = "";
  String password = "";
  String passwordInput = "";
  String field = "";
  String fieldInput = "";
  String name = "";
  String nameInput = "";
  String errorMessage = "";

  signUp() async {
    setState(() {
      errorMessage = "";
      email = "";
      password = "";
      user = null;
    });

    if (emailInput != "" && passwordInput != "") {
      email = emailInput;
      password = passwordInput;
      field = fieldInput;
      name = nameInput;
      user = await SignUpService().signUp(email, password, name, field);

      if (user != null) {
        email = "";
        emailInput = "";
        password = "";
        passwordInput = "";
        errorMessage = "";
        // ignore: use_build_context_synchronously
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen(
                user: user,
              );
            },
          ),
        );
      } else {
        setState(() {
          errorMessage = "Sign Up Failed";
        });
      }
    } else {
      setState(() {
        errorMessage = "All Input Must be filled";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      body: Center(
        heightFactor: size.height,
        widthFactor: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                "Sign Up",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
              RoundedInputField(
                hintText: "Name",
                onChanged: (value) {
                  setState(() {
                    nameInput = value;
                  });
                },
              ),
              RoundedInputField(
                hintText: "Email",
                onChanged: (value) {
                  setState(() {
                    emailInput = value;
                  });
                },
              ),
              RoundedInputField(
                hintText: "Field of Study",
                onChanged: (value) {
                  setState(() {
                    fieldInput = value;
                  });
                },
              ),
              RoundedPasswordField(
                onChanged: (value) {
                  setState(() {
                    passwordInput = value;
                  });
                },
              ),
              RoundedButton(
                text: "SIGN UP",
                press: () {
                  signUp();
                },
                color: primaryColor,
              ),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginScreen();
                      },
                    ),
                  );
                },
                login: false,
              )
            ],
          ),
        ),
      ),
    );
  }
}
