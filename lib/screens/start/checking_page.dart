import 'package:cooking_tutorial_application/screens/home/homepage.dart';
import 'package:cooking_tutorial_application/screens/start/login_page.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CheckingPage extends StatelessWidget {
  static const nameRoute = '/check';
  const CheckingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Homepage();
        } else {
          return LoginPage();
        }
      },
    );
  }
}
