import 'package:cooking_tutorial_application/screens/profile/kebijakan.dart';
import 'package:cooking_tutorial_application/screens/profile/sk_page.dart';
import 'package:cooking_tutorial_application/screens/profile/ubah_akun_page.dart';
import 'package:cooking_tutorial_application/screens/profile/version.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  static const nameRoute = '/profilpage';
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            color: Colors.white,
            padding: const EdgeInsets.all(32.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          shape: BoxShape.circle,
                          image: const DecorationImage(
                            image: AssetImage('assets/profile.jpg'),
                            fit: BoxFit.cover,
                          ),
                          border: Border.all(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const <Widget>[
                            Text(
                              "Ricky Farez",
                              style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Poppins',
                                fontSize: 16.0,
                              ),
                            ),
                            Text(
                              "ricky4545@gmail.com",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              "Beginner",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'Akun dan Keamanan',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(
                            Icons.edit_outlined,
                            color: Colors.black,
                          ),
                          title: const Text(
                            'Ubah data akun',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const UbahAkunPage()),
                            );
                          },
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.person_add_outlined,
                            color: Colors.black,
                          ),
                          title: const Text(
                            'Version',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          onTap: () {
                            Navigator.pushNamed(context, VersionPage.nameRoute);
                          },
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    'About App',
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontSize: 16.0,
                    ),
                  ),
                  Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0)),
                    child: Column(
                      children: <Widget>[
                        ListTile(
                          leading: const Icon(
                            Icons.star_border_outlined,
                            color: Colors.black,
                          ),
                          title: const Text(
                            'Give Rating',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          onTap: () {},
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.note_outlined,
                            color: Colors.black,
                          ),
                          title: const Text(
                            'Syarat dan Ketentuan',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, SyaratKetentuanPage.nameRoute);
                          },
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.privacy_tip_outlined,
                            color: Colors.black,
                          ),
                          title: const Text(
                            'Kebijakan Privasi',
                            style: TextStyle(fontSize: 12, color: Colors.black),
                          ),
                          onTap: () {
                            Navigator.pushNamed(
                                context, KebijakanPage.nameRoute);
                          },
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.logout_outlined,
                            color: Colors.red,
                          ),
                          title: const Text(
                            'Log out',
                            style: TextStyle(fontSize: 12, color: Colors.red),
                          ),
                          onTap: () {
                            FirebaseAuth.instance.signOut();
                            Navigator.of(context, rootNavigator: true)
                                .pushNamed("/loginpage");
                          },
                        ),
                      ],
                    ),
                  ),
                ])));
  }
}
