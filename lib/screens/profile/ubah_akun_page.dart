import 'package:flutter/material.dart';

class UbahAkunPage extends StatefulWidget {
  static const nameRoute = '/ubahakunpage';

  const UbahAkunPage({super.key});

  @override
  State<UbahAkunPage> createState() => _UbahAkunPageState();
}

class _UbahAkunPageState extends State<UbahAkunPage> {
  final _formKey = GlobalKey<FormState>();
  bool _passwordInVisible = true;
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.keyboard_arrow_left,
                color: Color(0xff297061),
              )),
          title: const Text(
            'Ubah Data Akun',
            style: TextStyle(color: Color(0xff297061), fontFamily: 'Poppins'),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 120,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: Image(
                      image: AssetImage('assets/profile.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextButton(
                    onPressed: () {},
                    child: const Text(
                      'Ganti Foto Profil',
                      style: TextStyle(color: Colors.black, fontSize: 14),
                    )),
                const SizedBox(
                  height: 20,
                ),
                const Divider(),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFieldContainer(
                        child: TextFormField(
                          controller: _usernameController,
                          cursorColor: Color(0xff297061),
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.person_outlined,
                                color: Colors.black,
                              ),
                              hintText: "Ricky Farez",
                              hintStyle: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700),
                              border: InputBorder.none),
                        ),
                      ),
                      TextFieldContainer(
                        child: TextFormField(
                          controller: _phoneController,
                          cursorColor: Color(0xff297061),
                          decoration: InputDecoration(
                              icon: const Icon(
                                Icons.phone_outlined,
                                color: Colors.black,
                              ),
                              hintText: "085632446521",
                              hintStyle: const TextStyle(
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w700),
                              border: InputBorder.none),
                        ),
                      ),
                      TextFieldContainer(
                        child: TextFormField(
                          controller: _emailController,
                          cursorColor: const Color(0xff297061),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.email_outlined,
                                color: Colors.black,
                              ),
                              hintText: 'RickyFahrez4545@gmail.com',
                              hintStyle: TextStyle(fontFamily: 'Poppins'),
                              border: InputBorder.none),
                        ),
                      ),
                      TextFieldContainer(
                        child: TextFormField(
                          controller: _addressController,
                          cursorColor: const Color(0xff297061),
                          decoration: InputDecoration(
                              icon: Icon(
                                Icons.location_pin,
                                color: Colors.black,
                              ),
                              hintText: 'Jl, Lorem block 4',
                              hintStyle: TextStyle(fontFamily: 'Poppins'),
                              border: InputBorder.none),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      RoundedButton(
                        text: 'Simpan',
                        press: () {},
                      )
                    ],
                  ),
                )
              ]),
        )));
  }
}

class TextFieldContainer extends StatelessWidget {
  const TextFieldContainer({Key? key, this.child}) : super(key: key);
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: const Color(0xffFFFFFF),
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
            color: Color(0xffB6B6B6),
            offset: Offset(
              1.0,
              1.0,
            ), //Offset
            blurRadius: 5.0,
          ), //BoxShadow
        ],
      ),
      child: child,
    );
  }
}

class RoundedButton extends StatelessWidget {
  const RoundedButton(
      {Key? key, this.press, this.textColor = Colors.white, required this.text})
      : super(key: key);
  final String text;
  final Function()? press;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      width: size.width * 0.8,
      height: size.height * 0.06,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: newElevatedButton(),
      ),
    );
  }

  Widget newElevatedButton() {
    return ElevatedButton(
      onPressed: press,
      style: ElevatedButton.styleFrom(backgroundColor: const Color(0xff297061)),
      child: Text(
        text,
        style: TextStyle(color: textColor, fontSize: 14, fontFamily: 'Poppins'),
      ),
    );
  }
}
