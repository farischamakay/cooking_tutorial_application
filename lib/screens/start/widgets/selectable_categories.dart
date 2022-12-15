import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class ListCategoryWidget extends StatelessWidget {
  String urlImageCategory;
  String titleCategory;
  bool? isSelected;

  ListCategoryWidget(
      {required this.urlImageCategory, required this.titleCategory, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              height: 300,
              width: 150,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(urlImageCategory), fit: BoxFit.cover)),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            titleCategory,
            style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
