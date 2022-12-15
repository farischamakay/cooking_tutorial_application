import 'package:flutter/material.dart';

class KebijakanPage extends StatelessWidget {
  static const nameRoute = '/kebijakanpage';
  const KebijakanPage({super.key});

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
                  'Kebijakan Privasi',
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
                  'Table of content',
                  style: TextStyle(fontFamily: 'Poppins', fontSize: 16),
                ),
                SizedBox(
                  height: 5,
                ),
                Text('1. Lorem ipsum dolor sit amet,  adipiscing elit.'),
                Text('2. Lorem ipsum dolor sit amet,  adipiscing elit.'),
                Text('3. Lorem ipsum dolor sit amet,  adipiscing elit.'),
                Text('4. Lorem ipsum dolor sit amet,  adipiscing elit.'),
                Text('5. Lorem ipsum dolor sit amet,  adipiscing elit.'),
                SizedBox(
                  height: 7,
                ),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.  '),
                SizedBox(
                  height: 7,
                ),
                Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Viverra condimentum eget purus in. Consectetur eget id morbi amet amet, in. Ipsum viverra pretium tellus neque. Ullamcorper suspendisse aenean leo pharetra in sit semper et. Amet quam placerat sem.  '),
              ]),
        )));
  }
}
