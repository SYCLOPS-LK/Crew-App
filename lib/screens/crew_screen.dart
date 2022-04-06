import 'package:flutter/material.dart';

class CrewScreen extends StatefulWidget {
  const CrewScreen({Key? key}) : super(key: key);

  @override
  State<CrewScreen> createState() => _CrewScreenState();
}

class _CrewScreenState extends State<CrewScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
          child: SingleChildScrollView(
        child: Center(
          child: Text("Crew Screen"),
        ),
      )),
    );
  }
}
