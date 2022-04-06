import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Center(
      child: SingleChildScrollView(
        child: Text(
          "Settings Screen\nComing Soon",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 50.0,
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 246, 170, 79),
          ),
        ),
      ),
    ));
  }
}
