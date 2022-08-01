import 'package:flutter/material.dart';
import 'package:project1/Screens/Welcome/welcome_screen.dart';
import 'package:project1/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Authentication',
      theme: ThemeData(
        primaryColor: primaryColor,
        primaryColorLight: primaryColorLight,
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: const WelcomeScreen(),
    );
  }
}
