import 'package:cooking_tutorial_application/screens/home/bloc/homepage_recipe_bloc.dart';
import 'package:cooking_tutorial_application/screens/recipe_data/bloc/recipe_data_bloc.dart';
import 'package:cooking_tutorial_application/screens/recipe_random/random_recipe_screen.dart';
import 'package:cooking_tutorial_application/screens/recipe_search_result/bloc/recipe_search_result_bloc.dart';
import 'package:cooking_tutorial_application/screens/start/checking_page.dart';
import 'package:cooking_tutorial_application/screens/start/forgot_password.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:cooking_tutorial_application/screens/home/homepage.dart';
import 'package:cooking_tutorial_application/screens/start/login_page.dart';
import 'package:cooking_tutorial_application/screens/start/register_page.dart';
import 'package:cooking_tutorial_application/screens/start/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'screens/recipe_random/bloc/recipe_random_bloc.dart';
import 'screens/recipe_random/random_recipe_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  await Hive.openBox('Favorite');
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeRecipesBloc>(
        create: (context) => HomeRecipesBloc(LoadHomepageRecipe())),
    BlocProvider<RecipeRandomBloc>(
      create: (context) => RecipeRandomBloc(),
      child: const RandomRecipe(),
    ),
    BlocProvider(
      create: (context) => RecipeDataBloc(),
    ),
    BlocProvider(
      create: (context) => RecipeSearchResultBloc(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cooking Tutorial Apps',
      theme: ThemeData(
        fontFamily: 'Satoshi',
        primarySwatch: Colors.blue,
        primaryColor: Colors.redAccent,
        textTheme: const TextTheme(
          headline1: TextStyle(
            fontFamily: 'Telma',
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      initialRoute: Splash.nameRoutes,
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.nameRoutes: (context) => const Splash(),
        CheckingPage.nameRoute: (context) => const CheckingPage(),
        '/LoginPage': (BuildContext context) => const LoginPage(),
        '/RegisterPage': (BuildContext context) => const RegisterPage(),
        ForgotPasswordPage.nameRoute: (context) => const ForgotPasswordPage(),
        Homepage.nameRoute: (context) => const Homepage(),
      },
    );
  }
}
