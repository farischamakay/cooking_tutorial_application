import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPasswordPage extends StatefulWidget {
  static const nameRoute = '/forgotpass';
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: const Text(
                  'Password reset link sent! Please check your email'),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/LoginPage');
                    },
                    child: const Text('Oke')),
              ],
            );
          });
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              content: Text(e.message.toString()),
            );
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Forgot Password'),
        backgroundColor: const Color(0xfff1bb274),
      ),
      backgroundColor: const Color(0xffecebf3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text(
                'Enter your email and we will send you  a password reset link'),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: TextField(
              controller: _emailController,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Color(0xfff1bb274)),
                  borderRadius: BorderRadius.circular(12),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Color(0xfff1bb274)),
                    borderRadius: BorderRadius.circular(12)),
                hintText: 'Email',
                fillColor: Colors.white,
                filled: true,
              ),
            ),
          ),
          MaterialButton(
            onPressed: () {
              passwordReset();
            },
            color: Color(0xfff1bb274),
            child: const Text('Reset Password'),
          )
        ],
      ),
    );
  }
}
