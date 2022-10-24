import 'package:cooking_tutorial_application/screens/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Splash extends StatefulWidget {
  static const nameRoutes = '/splash';
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5)).then((value) =>
        {Navigator.pushReplacementNamed(context, LoginPage.nameRoute)});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/splash_logo.png',
            height: 350,
            width: 350,
          ),
          const SizedBox(
            height: 10,
          ),
          const SpinKitThreeBounce(
            color: Colors.red,
            size: 50.0,
          ),
        ],
      ),
    );
  }
}
