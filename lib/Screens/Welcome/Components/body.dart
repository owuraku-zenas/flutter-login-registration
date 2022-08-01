import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:project1/Screens/Login/login_screen.dart';
import 'package:project1/Screens/Welcome/Components/background.dart';
import 'package:project1/constants.dart';

import '../../../Components/rounded_button.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              "Welcome",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: size.height * 0.03),
            // SvgPicture.asset(
            //   "assets/icons/chat.svg",
            //   height: size.height * 0.3,
            //   width: size.width * 0.8,
            // ),
            SizedBox(height: size.height * 0.03),
            RoundedButton(
              text: "LOGIN",
              color: primaryColor,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "SIGN UP",
              color: primaryColorLight,
              textColor: Colors.black,
              press: () {},
            ),
          ],
        ),
      ),
    );
  }
}
