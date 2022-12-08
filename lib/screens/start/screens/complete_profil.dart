import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';

import '../widgets/rounded_button.dart';

class CompleteProfilPage extends StatefulWidget {
  static const nameRoute = 'completeprofile';
  const CompleteProfilPage({super.key});

  @override
  State<CompleteProfilPage> createState() => _CompleteProfilPageState();
}

class _CompleteProfilPageState extends State<CompleteProfilPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _levelController = TextEditingController();
  final TextEditingController _countryController = TextEditingController();
  final TextEditingController _vegeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 90, horizontal: 35),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Complete your profile',
              style: TextStyle(fontSize: 30, fontFamily: 'Satoshi'),
            ),
            const SizedBox(
              height: 45,
            ),
            TextFormField(
              controller: _usernameController,
              cursorColor: const Color(0xfff1bb274),
              decoration: const InputDecoration(
                hintText: 'Username',
                hintStyle: TextStyle(fontFamily: 'OpenSans'),
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            TextDropdownFormField(
              options: ["Male", "Female"],
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  labelText: "Gender"),
              dropdownHeight: 120,
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _levelController,
              cursorColor: const Color(0xfff1bb274),
              decoration: const InputDecoration(
                  hintText: 'Level',
                  hintStyle: TextStyle(fontFamily: 'OpenSans'),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 15,
            ),
            TextFormField(
              controller: _countryController,
              cursorColor: const Color(0xfff1bb274),
              decoration: const InputDecoration(
                  hintText: 'Country',
                  hintStyle: TextStyle(fontFamily: 'OpenSans'),
                  border: OutlineInputBorder()),
            ),
            const SizedBox(
              height: 15,
            ),
            TextDropdownFormField(
              options: ["Vegetarian", "Vegan"],
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  labelText: "Are you Vegetarian?"),
              dropdownHeight: 120,
            ),
            const SizedBox(
              height: 20,
            ),
            RoundedButton(text: 'NEXT', press: () {})
          ],
        ),
      ),
    );
  }
}
