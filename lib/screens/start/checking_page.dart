import 'package:cooking_tutorial_application/screens/navigator/bottom_navigator.dart';
import 'package:cooking_tutorial_application/screens/start/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class CheckingPage extends StatelessWidget {
  static const nameRoute = '/check';
  const CheckingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return const BottomNavigatorView();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}
