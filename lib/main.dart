import 'package:cooking_tutorial_application/screens/home/bloc/homepage_recipe_bloc.dart';
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

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var dir = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(dir.path);
  await Hive.openBox('Favorite');
  runApp(MultiBlocProvider(providers: [
    BlocProvider<HomeRecipesBloc>(
      create: (context) => HomeRecipesBloc(LoadHomepageRecipe()),
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
          textTheme:
              const TextTheme(headline1: TextStyle(fontFamily: 'Thelma'))),
      initialRoute: Splash.nameRoutes,
      debugShowCheckedModeBanner: false,
      routes: {
        Splash.nameRoutes: (context) => const Splash(),
        CheckingPage.nameRoute: (context) => const CheckingPage(),
        LoginPage.nameRoute: (context) => const LoginPage(),
        RegisterPage.nameRoute: (context) => const RegisterPage(),
        ForgotPasswordPage.nameRoute: (context) => const ForgotPasswordPage(),
        HomePage.nameRoute: (context) => const HomePage(),
      },
    );
  }
}
