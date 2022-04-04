import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:crew_app/model/user_model.dart';
import 'package:crew_app/screens/login_screen.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 20, 28, 36),
      bottomNavigationBar: BottomAppBar(
        color: const Color.fromARGB(255, 246, 170, 79),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                logout(context);
              },
              icon: const Icon(
                Icons.exit_to_app_outlined,
                color: Color.fromARGB(255, 20, 28, 36),
              ),
            ),
            Text(
              "${loggedInUser.firstName} | ${loggedInUser.email}".toUpperCase(),
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 13.0,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 20, 28, 36),
              ),
            ),
          ],
        ),
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
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width / 2.4,
                      width: MediaQuery.of(context).size.width / 2.4,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(25)),
                        image: DecorationImage(
                          image: AssetImage("assets/malith.jpg"),
                          fit: BoxFit.contain,
                          opacity: 30.0,
                        ),
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(255, 20, 28, 36),
                            Color.fromARGB(255, 20, 28, 36),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginScreen()));
  }
}
