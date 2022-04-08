import 'package:crew_app/preference/user_preference.dart';
import 'package:crew_app/screens/login_screen.dart';
import 'package:crew_app/screens/registration_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await UserPreferences.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crew App',
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: const LoginScreen(),
    );
  }
}
