import 'package:crew_app/screens/crew_screen.dart';
import 'package:crew_app/screens/main_screen.dart';
import 'package:crew_app/screens/settings_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  final bottomNavigationBarItems = <Widget>[
    const Icon(
      Icons.person_outline,
      size: 30.0,
      color: Color.fromARGB(255, 20, 28, 36),
    ),
    const Icon(
      Icons.home_outlined,
      size: 30.0,
      color: Color.fromARGB(255, 20, 28, 36),
    ),
    const Icon(
      Icons.settings_outlined,
      size: 30.0,
      color: Color.fromARGB(255, 20, 28, 36),
    ),
  ];

  var index = 1;

  final screens = [
    const CrewScreen(),
    const MainScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        color: const Color.fromARGB(255, 246, 170, 79),
        backgroundColor: Colors.transparent,
        height: 50.0,
        items: bottomNavigationBarItems,
        onTap: (index) => setState(() => this.index = index),
        animationDuration: const Duration(milliseconds: 200),
      ),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 246, 170, 79),
        title: const Text(
          "53CTF CREW | BY SYCLOPS",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 20, 28, 36),
          ),
        ),
        centerTitle: true,
      ),
      body: screens[index],
    );
  }
}
