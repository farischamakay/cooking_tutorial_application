import 'package:cooking_tutorial_application/models/category.dart';
import 'package:cooking_tutorial_application/screens/start/screens/user_preferences.dart';
import 'package:drag_select_grid_view/drag_select_grid_view.dart';
import 'package:flutter/material.dart';

import '../widgets/selectable_categories.dart';

class CategoryPage extends StatefulWidget {
  static const routeName = '/categorypage';
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  final controller = DragSelectGridViewController();

  @override
  void initState() {
    super.initState();
    controller.addListener(rebuild);
  }

  @override
  void dispose() {
    controller.removeListener(rebuild);
    super.dispose();
  }

  void rebuild() => setState(() {});

  @override
  Widget build(BuildContext context) {
    final isSelected = controller.value.isSelecting;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'What do  you want to cook?',
              style: TextStyle(color: Colors.black),
            ),
            Text(
              'Get better recommendations with these categories',
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
      body: DragSelectGridView(
        gridController: controller,
        padding: EdgeInsets.all(15),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, crossAxisSpacing: 8, mainAxisSpacing: 3),
        itemCount: items.length,
        itemBuilder: (context, index, isSelected) {
          return ListCategoryWidget(
            urlImageCategory: items[index].urlPath,
            titleCategory: items[index].categoryName,
            isSelected: isSelected,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xfff1bb274),
          child: Icon(
            Icons.navigate_next_rounded,
            size: 50,
          ),
          onPressed: () {
            Navigator.pushNamed(context, UserPreferencesPage.routeName);
          }),
    );
  }
}
