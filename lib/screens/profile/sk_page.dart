import 'package:flutter/material.dart';

class SyaratKetentuanPage extends StatefulWidget {
  static const nameRoute = '/skpage';
  const SyaratKetentuanPage({super.key});

  @override
  State<SyaratKetentuanPage> createState() => _SyaratKetentuanPageState();
}

class _SyaratKetentuanPageState extends State<SyaratKetentuanPage> {
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
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'Syarat Dan Ketentuan',
                  style: TextStyle(
                      color: Color(0xff297061), fontFamily: 'Poppins'),
                ),
                Text(
                  'Terakhir di perbaharui  22/01/2022',
                  style: TextStyle(color: Colors.grey, fontSize: 10),
                )
              ],
            )),
        body: SingleChildScrollView(
            child: Container(
          padding: const EdgeInsets.all(30.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '1. Cause One',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.  '),
                SizedBox(
                  height: 7,
                ),
                Text(
                  '2. Cause Two',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.  '),
                SizedBox(
                  height: 7,
                ),
                Text(
                  '3. Cause Three',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.  '),
              ]),
        )));
  }
}
