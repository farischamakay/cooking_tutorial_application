import 'package:cooking_tutorial_application/screens/home/bloc/homepage_recipe_bloc.dart';
import 'package:cooking_tutorial_application/screens/profile/profile_page.dart';
import 'package:cooking_tutorial_application/screens/profile/ubah_akun_page.dart';
import 'package:cooking_tutorial_application/screens/profile/version.dart';
import 'package:cooking_tutorial_application/screens/recipe_data/bloc/recipe_data_bloc.dart';
import 'package:cooking_tutorial_application/screens/recipe_random/random_recipe_screen.dart';
import 'package:cooking_tutorial_application/screens/recipe_search_result/bloc/recipe_search_result_bloc.dart';
import 'package:cooking_tutorial_application/screens/start/checking_page.dart';
import 'package:cooking_tutorial_application/screens/start/screens/category_screen.dart';
import 'package:cooking_tutorial_application/screens/start/screens/complete_profil.dart';
import 'package:cooking_tutorial_application/screens/start/screens/forgot_password.dart';
import 'package:cooking_tutorial_application/screens/start/screens/screens.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:cooking_tutorial_application/screens/home/homepage.dart';
import 'package:cooking_tutorial_application/screens/start/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'screens/recipe_random/bloc/recipe_random_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);

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
              fontFamily: 'Satisfy',
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white),
        ),
      ),
      initialRoute: Splash.nameRoutes,
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.nameRoutes: (context) => const Splash(),
        CheckingPage.nameRoute: (context) => const CheckingPage(),
        '/loginpage': (BuildContext context) => const LoginScreen(),
        SignUpScreen.nameRoute: (BuildContext context) => const SignUpScreen(),
        ProfilePage.nameRoute: (context) => const ProfilePage(),
        VersionPage.nameRoute: (context) => const VersionPage(),
        UbahAkunPage.nameRoute: (context) => const UbahAkunPage(),
        ForgotPasswordPage.nameRoute: (context) => const ForgotPasswordPage(),
        CompleteProfilPage.nameRoute: (context) => const CompleteProfilPage(),
        CategoryPage.routeName: (context) => const CategoryPage(),
        Homepage.nameRoute: (context) => const Homepage(),
      },
    );
  }
}
