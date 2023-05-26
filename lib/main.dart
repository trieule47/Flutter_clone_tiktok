import 'package:flutter/material.dart';
import 'package:flutter_clone_tiktok/constants.dart';
import 'package:flutter_clone_tiktok/models/screens/auth/login_screen.dart';
import 'package:flutter_clone_tiktok/models/screens/auth/signup_screen.dart';

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
      title: 'Tiktok clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      home: SignupScreen(),
      // home: LoginScreen(),
    );
  }
}
