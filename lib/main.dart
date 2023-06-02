import 'package:flutter/material.dart';
import 'package:flutter_clone_tiktok/constants.dart';
import 'package:flutter_clone_tiktok/controllers/auth_controller.dart';
import 'package:flutter_clone_tiktok/views/screens/auth/login_screen.dart';
import 'package:flutter_clone_tiktok/views/screens/auth/signup_screen.dart';
import 'package:flutter_clone_tiktok/views/screens/home_screen.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
	await Firebase.initializeApp().then((value) => {
    Get.put(AuthController())
  });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tiktok clone',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
      ),
      // home: SignupScreen(),
      // home: LoginScreen(),
      home: HomeScreen(),
    );
  }
}
