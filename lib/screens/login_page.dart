import 'package:cooking_tutorial_application/animation/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LoginPage extends StatefulWidget {
  static const nameRoute = '/loginpage';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
                          height: 60,
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
                          child: Column(
                            children: <Widget>[
                              DelayedDisplay(
                                  child: Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromARGB(
                                                255, 238, 238, 238)))),
                                child: const TextField(
                                  decoration: InputDecoration(
                                      hintText: "Email or Phone number",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              )),
                              Container(
                                padding: const EdgeInsets.all(10),
                                decoration: const BoxDecoration(
                                    border: Border(
                                        bottom: BorderSide(
                                            color: Color.fromARGB(
                                                255, 238, 238, 238)))),
                                child: const TextField(
                                  decoration: InputDecoration(
                                      hintText: "Password",
                                      hintStyle: TextStyle(color: Colors.grey),
                                      border: InputBorder.none),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        const Text(
                          "Forgot Password?",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        Container(
                          height: 50,
                          margin: const EdgeInsets.symmetric(horizontal: 50),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: const Color(0xffed073f)),
                          child: const Center(
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("Don't have an account? Click here",
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
