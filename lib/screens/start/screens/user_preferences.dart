import 'package:cooking_tutorial_application/screens/profile/profile_page.dart';
import 'package:cooking_tutorial_application/screens/profile/ubah_akun_page.dart';
import 'package:flutter/material.dart';

class UserPreferencesPage extends StatefulWidget {
  static const routeName = '/userpreferences';
  const UserPreferencesPage({super.key});

  @override
  State<UserPreferencesPage> createState() => _UserPreferencesPageState();
}

class _UserPreferencesPageState extends State<UserPreferencesPage> {
  TextEditingController _textEditingController = new TextEditingController();
  late List<String> _values;
  late List<bool> _selected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Any preferences?',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Get better recommendations with your preferences',
              style: TextStyle(
                  color: Colors.grey, fontSize: 11, fontFamily: 'Poppins'),
            )
          ],
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style: TextStyle(color: Colors.grey),
              ))
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                height: 200,
                width: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/user_preference.png'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextFormField(
              cursorColor: const Color(0xfff1bb274),
              decoration: const InputDecoration(
                hintText: 'Input your preferences',
                hintStyle: TextStyle(fontFamily: 'OpenSans'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 270,
            ),
            RoundedButton(
              text: 'Find Recommendation',
              press: () {
                Navigator.pushNamed(context, ProfilePage.nameRoute);
              },
            )
          ],
        ),
      ),
    );
  }
}
