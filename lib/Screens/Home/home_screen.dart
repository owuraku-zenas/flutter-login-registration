import 'package:flutter/material.dart';
import 'package:project1/Components/rounded_button.dart';
import 'package:project1/Components/text_field_container.dart';
import 'package:project1/Screens/Welcome/welcome_screen.dart';

import 'package:project1/constants.dart';
import 'package:project1/models/user.dart';

class HomeScreen extends StatelessWidget {
  final User? user;

  const HomeScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: const Center(
          child: Icon(Icons.home),
        ),
        backgroundColor: primaryColor,
        title: const Center(child: Text("Home Screen")),
      ),
      body: Center(
        heightFactor: size.height,
        widthFactor: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextFieldContainer(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      const Text("Name:",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black26)),
                      const SizedBox(width: 10),
                      Text(user?.user.name ?? ""),
                    ],
                  ),
                ),
              ),
              TextFieldContainer(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      const Text("Email",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black26)),
                      const SizedBox(width: 10),
                      Text(user?.user.email ?? ""),
                    ],
                  ),
                ),
              ),
              TextFieldContainer(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      const Text("Password",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.black26)),
                      const SizedBox(width: 10),
                      Text(user?.user.field ?? ""),
                    ],
                  ),
                ),
              ),
              RoundedButton(
                text: "SIGN OUT",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const WelcomeScreen();
                      },
                    ),
                  );
                },
                color: primaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
