import 'package:flutter/material.dart';
import 'package:project1/Components/already_have_an_account_check.dart';
import 'package:project1/Components/rounded_button.dart';
import 'package:project1/Components/rounded_input_field.dart';
import 'package:project1/Components/rounded_password_field.dart';
import 'package:project1/Screens/Home/home_screen.dart';
import 'package:project1/Screens/SignUp/signup_screen.dart';
import 'package:project1/constants.dart';
import 'package:project1/models/user.dart';
import 'package:project1/services/login_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  User? user;
  String email = "";
  String emailInput = "";
  String password = "";
  String passwordInput = "";
  String errorMessage = "";

  getUserData() async {
    setState(() {
      errorMessage = "";
      email = "";
      password = "";
      user = null;
    });

    if (emailInput != "" && passwordInput != "") {
      email = emailInput;
      password = passwordInput;
      user = await LoginService().getUser(email, password);

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
          errorMessage = "Login Failed";
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
        widthFactor: double.infinity,
        heightFactor: size.height,
        child: SingleChildScrollView(
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
              Text(
                errorMessage,
                style: const TextStyle(color: Colors.red),
              ),
              RoundedInputField(
                hintText: "Enter Email",
                onChanged: (value) {
                  setState(() {
                    emailInput = value;
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
                  text: "LOGIN",
                  press: () {
                    getUserData();
                  },
                  color: primaryColor),
              SizedBox(height: size.height * 0.03),
              AlreadyHaveAnAccountCheck(
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const SignUpScreen();
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
