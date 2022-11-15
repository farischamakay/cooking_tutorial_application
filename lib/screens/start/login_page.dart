import 'package:cooking_tutorial_application/animation/animation.dart';
import 'package:cooking_tutorial_application/screens/home/homepage.dart';
import 'package:cooking_tutorial_application/screens/navigator/bottom_navigator.dart';
import 'package:cooking_tutorial_application/screens/start/forgot_password.dart';
import 'package:cooking_tutorial_application/screens/start/register_page.dart';
import 'package:flutter/material.dart';
import 'authentication/auth.dart';
import 'authentication/auth_error.dart';
import '../../animation/animation.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  static const nameRoute = '/loginpage';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // teks controllers
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  bool visiblePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, colors: [
          Color(0xffed073f),
          Color(0xfff70a2a),
          Color.fromARGB(255, 248, 160, 28)
        ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const <Widget>[
                  DelayedDisplay(
                      child: Text(
                    "Login",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  )),
                  SizedBox(
                    height: 10,
                  ),
                  DelayedDisplay(
                      child: Text(
                    "Welcome Back",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  )),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(60),
                        topRight: Radius.circular(60))),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: const [
                                  BoxShadow(
                                      color: Color.fromRGBO(225, 95, 27, .3),
                                      blurRadius: 20,
                                      offset: Offset(0, 10))
                                ]),
                            child: DelayedDisplay(
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 238, 238, 238)))),
                                    child: TextField(
                                      controller: _emailController,
                                      decoration: const InputDecoration(
                                          hintText: "Email",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 5,
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: const BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Color.fromARGB(
                                                    255, 238, 238, 238)))),
                                    child: TextField(
                                      controller: _passwordController,
                                      decoration: const InputDecoration(
                                          hintText: "Password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                        const SizedBox(
                          height: 20,
                        ),
                        Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 25.0),
                            child: GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, ForgotPasswordPage.nameRoute);
                              },
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text('Forgot Password?',
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.bold))
                                ],
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: authErrorlogin != ''
                              ? Text(
                                  textAlign: TextAlign.center,
                                  authErrorlogin.split(']')[1],
                                  style: const TextStyle(
                                      color: Colors.red,
                                      fontWeight: FontWeight.bold),
                                )
                              : null,
                        ),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xffed073f)),
                          child: GestureDetector(
                            onTap: () {
                              FirebaseAuth.instance
                                  .signInWithEmailAndPassword(
                                      email: _emailController.text.trim(),
                                      password: _passwordController.text.trim())
                                  .then((value) => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const BottomNavigatorView())));
                            },
                            child: const Center(
                              child: Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        const Text("Don't Have an account? "),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/RegisterPage');
                          },
                          child: const Text("Click here",
                              style: TextStyle(color: Colors.blue)),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
