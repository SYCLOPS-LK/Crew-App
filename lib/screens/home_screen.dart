import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crew_app/model/user_model.dart';
import 'package:crew_app/screens/login_screen.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  final bottomNavigationBarItems = <Widget>[
    Icon(
      Icons.person_outline,
      size: 30.0,
      color: Color.fromARGB(255, 20, 28, 36),
    ),
    Icon(
      Icons.home_outlined,
      size: 30.0,
      color: Color.fromARGB(255, 20, 28, 36),
    ),
    Icon(
      Icons.settings_outlined,
      size: 30.0,
      color: Color.fromARGB(255, 20, 28, 36),
    ),
  ];

  var index = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: const Color.fromARGB(255, 20, 28, 36),
      bottomNavigationBar: CurvedNavigationBar(
        index: index,
        color: Color.fromARGB(255, 246, 170, 79),
        backgroundColor: Colors.transparent,
        height: 50.0,
        items: bottomNavigationBarItems,
        onTap: (index) => setState(() => this.index = index),
        animationDuration: Duration(milliseconds: 200),
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
      body: Center(child: Text("$index")),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
