import 'package:cooking_tutorial_application/screens/start/screens/category_screen.dart';
import 'package:dio/dio.dart';
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

  String radioButtonItem = 'Male';
  int val = -1;

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
              options: ["Beginner", "Middle", "Expert"],
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  suffixIcon: Icon(Icons.arrow_drop_down),
                  labelText: "Level",
                  labelStyle: TextStyle(fontFamily: 'Poppins')),
              dropdownHeight: 200,
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Text(
                    'Please Let us know your gender : ',
                    style: TextStyle(fontSize: 16, fontFamily: 'OpenSans'),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Radio(
                              value: 1,
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  radioButtonItem = 'Male';
                                  val = 1;
                                });
                              },
                              activeColor: Colors.green,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text('Male'),
                          ],
                        ),
                      ),
                      const SizedBox(
                        width: 30,
                      ),
                      Container(
                        child: Row(
                          children: [
                            Radio(
                              value: 2,
                              groupValue: val,
                              onChanged: (value) {
                                setState(() {
                                  radioButtonItem = 'Female';
                                  val = 2;
                                });
                              },
                              activeColor: Colors.green,
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            const Text('Female'),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
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
            RoundedButton(
                text: 'NEXT',
                press: () {
                  Navigator.pushNamed(context, CategoryPage.routeName);
                })
          ],
        ),
      ),
    );
  }
}
