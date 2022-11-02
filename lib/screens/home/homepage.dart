import 'package:flutter/material.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../animation/animation.dart';
import '../models/food_type.dart';
import '../home/bloc/homepage_recipe_bloc.dart';
import '../home/widget/food_category_list.dart';
import '../home/widget/horizontal_list.dart';
import '../home/widget/list_items.dart';
import '../recipe_data/bloc/recipe_data_bloc.dart';
import '../recipe_data/recipe_data_screen.dart';

class HomePage extends StatefulWidget {
  static const nameRoute = '/homepage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeRecipesBloc bloc;
  @override
  void initState() {
    bloc = BlocProvider.of<HomeRecipesBloc>(context);
    bloc.add(LoadHomepageRecipe());
    initDynamicLinks(context);

    super.initState();
  }

  initDynamicLinks(BuildContext context) async {
    // FirebaseDynamicLinks.instance.onLink(
    //     onSuccess: (PendingDynamicLinkData? dynamicLink) async {
    //   final Uri? deepLink = dynamicLink?.link;

    //   if (deepLink != null) {
    //     Navigator.push(
    //       context,
    //       MaterialPageRoute(
    //         builder: (context) => BlocProvider(
    //           create: (context) => RecipeInfoBloc(),
    //           child: RecipeInfo(
    //             id: deepLink.queryParameters['id']!,
    //           ),
    //         ),
    //       ),
    //     );
    //   }
    // }, onError: (OnLinkErrorException e) async {
    //   print('onLinkError');
    //   print(e.message);
    // });

    final PendingDynamicLinkData? data =
        await FirebaseDynamicLinks.instance.getInitialLink();
    final Uri? deepLink = data?.link;

    if (deepLink != null) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => BlocProvider(
            create: (context) => RecipeDataBloc(),
            child: RecipeInfo(
              id: deepLink.queryParameters['id']!,
            ),
          ),
        ),
      );
    }
  }

  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text(
            'Cooking Tutorial',
            style: TextStyle(
                fontFamily: 'Thelma',
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
                fontSize: 40,
                color: Colors.red),
          ),
        ),
        backgroundColor: Colors.white,
        body: BlocBuilder<HomeRecipesBloc, HomepageRecipeState>(
          builder: (context, state) {
            if (state is HomepageRecipeLoading) {
              return const Center(child: LoadingWidget());
            } else if (state is HomepageRecipeSuccess) {
              return HomeScreenWidget(
                breakfast: state.breakfast,
                cake: state.cake,
                drinks: state.drinks,
                burgers: state.burgers,
                lunch: state.lunch,
                pizza: state.pizza,
                rice: state.rice,
              );
            } else if (state is HomepageRecipeError) {
              return Center(
                child: Container(
                  child: Text("Error"),
                ),
              );
            } else {
              return Center(
                child: Container(
                  child: Text("Nothing"),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class HomeScreenWidget extends StatefulWidget {
  final List<FoodType> breakfast;
  final List<FoodType> lunch;
  final List<FoodType> drinks;
  final List<FoodType> burgers;
  final List<FoodType> pizza;
  final List<FoodType> cake;
  final List<FoodType> rice;

  const HomeScreenWidget({
    super.key,
    required this.breakfast,
    required this.lunch,
    required this.drinks,
    required this.burgers,
    required this.pizza,
    required this.cake,
    required this.rice,
  });

  @override
  _HomeScreenWidgetState createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: const BouncingScrollPhysics(),
        children: [
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: DelayedDisplay(
              delay: Duration(microseconds: 600),
              child: Text(
                "Hello, Welcome to our \nTasty food tutorial",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const HorizontalList(),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.all(26.0),
            child: TextField(
              onSubmitted: (value) {},
              decoration: InputDecoration(
                hintText: "Search Recipes",
                suffixIcon:
                    IconButton(icon: Icon(Icons.search), onPressed: () {}),
                contentPadding:
                    const EdgeInsets.symmetric(vertical: 4, horizontal: 20),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 2,
                    style: BorderStyle.solid,
                    color: Theme.of(context).primaryColor,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    color: Colors.black.withOpacity(.5),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: header("Popular Breakfast Recipes", "breakfast"),
          ),
          const SizedBox(height: 10),
          DelayedDisplay(
            delay: const Duration(microseconds: 600),
            child: FoodTypeWidget(
              items: widget.breakfast,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header("Best Lunch Recipes", "lunch"),
                ...widget.lunch.map((meal) {
                  return ListItem(
                    meal: meal,
                  );
                }).toList(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: header("Popular Drinks", "drinks"),
          ),
          const SizedBox(height: 10),
          FoodTypeWidget(items: widget.drinks),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header("Best burgers Recipes", "burgers"),
                ...widget.burgers.map((meal) {
                  return ListItem(
                    meal: meal,
                  );
                }).toList(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 26.0),
            child: header("pizza", "pizza"),
          ),
          const SizedBox(height: 10),
          FoodTypeWidget(items: widget.pizza),
          Padding(
            padding: const EdgeInsets.all(14.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                header("Wants best cake", "cake"),
                ...widget.cake.map((meal) {
                  return ListItem(
                    meal: meal,
                  );
                }).toList(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  header(String name, String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DelayedDisplay(
            delay: const Duration(microseconds: 600),
            child: Text(name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                )),
          ),
          IconButton(
              onPressed: () {
                // Navigator.of(context).push(
                //   MaterialPageRoute(
                //     builder: (context) => BlocProvider(
                //       create: (context) => SearchResultsBloc(),
                //       child: SearchResults(
                //         id: title,
                //       ),
                //     ),
                //   ),
                // );
              },
              icon: Icon(Icons.arrow_forward_sharp))
        ],
      ),
    );
  }
}

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: 30,
      height: 30,
      child: CircularProgressIndicator(
        color: Colors.redAccent,
        strokeWidth: 1.5,
        backgroundColor: Colors.grey,
      ),
    );
  }
}
