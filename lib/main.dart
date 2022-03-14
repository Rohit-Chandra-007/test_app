import 'package:flutter/material.dart';
import 'package:test_app/screens/home_screen.dart';
import 'package:test_app/screens/login_screen.dart';
import 'package:test_app/screens/splash_screen.dart';
import 'package:test_app/utils/route.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const SplashPage(),
        MyRoutes.homeRoute: (context) => HomeScreen(),
        MyRoutes.loginRoute: (context) => LoginScreen()
      },
    );
  }
}
