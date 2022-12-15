import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../../models/recipe.dart';
import '../../models/food_type.dart';
import '../home/widget/list_items.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: const Color(0xfff1bb274),
          title: Text(
            "EasyCook",
            style: Theme.of(context).textTheme.headline1,
          ),
        ),
        body: ValueListenableBuilder<Box>(
            valueListenable: Hive.box('Favorite').listenable(),
            builder: (context, box, child) {
              if (box.isEmpty) {
                return Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Icon(
                        CupertinoIcons.heart_fill,
                        size: 105,
                        color: Colors.grey,
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          "Tidak ada resep favorite.",
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline1,
                        ),
                      ),
                    ],
                  ),
                );
              }
              return ListView.builder(
                  itemBuilder: (context, i) {
                    final info = box.getAt(i);
                    final data = Recipe.fromJson(info);

                    return ListItem(
                      meal: FoodType(
                        id: data.id.toString(),
                        image: data.image!,
                        name: data.title!,
                        readyInMinutes: data.readyInMinutes.toString(),
                      ),
                    );
                  },
                  itemCount: box.length);
            }),
      ),
    );
  }
}
