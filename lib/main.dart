import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:mwiti_app/pages/authentication/sign_In_screen.dart';
import 'package:mwiti_app/pages/onboarding_screen.dart';
import 'package:mwiti_app/routes/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  final prefs = await SharedPreferences.getInstance();
  final showHome = prefs.getBool('showHome') ?? false;

  runApp(MyApp(showHome: showHome));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.showHome}) : super(key: key);

  final bool showHome;

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        title: 'mwiti ',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
          brightness: Brightness.dark,
        ),
        home: showHome ? SignInScreen() : const OnboardingPage(),
        //initialRoute: '/login',
        getPages: allRoutes);
  }
}
