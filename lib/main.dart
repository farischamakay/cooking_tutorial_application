import 'package:cooking_tutorial_application/screens/homepage.dart';
import 'package:cooking_tutorial_application/screens/login_page.dart';
import 'package:cooking_tutorial_application/screens/register_page.dart';
import 'package:cooking_tutorial_application/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking Tutorial Apps',
      initialRoute: Splash.nameRoutes,
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.nameRoutes: (context) => const Splash(),
        LoginPage.nameRoute: (context) => LoginPage(),
        RegisterPage.nameRoute: (context) => RegisterPage(),
        HomePage.nameRoute: (context) => HomePage(),
      },
    );
  }
}
