import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xfff1bb274),
        title: Text(
          "EasyCook",
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Hello, ${user.email!}'),
            ElevatedButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.of(context, rootNavigator: true)
                      .pushNamed("/LoginPage");
                },
                child: const Text('Log out'))
          ],
        ),
      ),
    );
  }
}
