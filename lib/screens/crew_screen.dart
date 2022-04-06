import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CrewScreen extends StatefulWidget {
  const CrewScreen({Key? key}) : super(key: key);

  @override
  State<CrewScreen> createState() => _CrewScreenState();
}

class _CrewScreenState extends State<CrewScreen> {
  final Stream<QuerySnapshot> crew =
      FirebaseFirestore.instance.collection("crew").snapshots();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          padding: const EdgeInsets.all(15.0),
          child: StreamBuilder<QuerySnapshot>(
            stream: crew,
            builder: (
              BuildContext context,
              AsyncSnapshot<QuerySnapshot> snapshot,
            ) {
              if (snapshot.hasError) {
                return const Center(
                  child: Text(
                    "Something went wrong!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                );
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: Text(
                    "Retrieving data form the database",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0),
                  ),
                );
              }
              final data = snapshot.requireData;
              return ListView.builder(
                itemCount: data.size,
                itemBuilder: (context, index) {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      color: Color.fromARGB(255, 20, 28, 36),
                      elevation: 5.0,
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Color.fromARGB(255, 246, 170, 79),
                          width: 2.0,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text(
                              "${data.docs[index]['name']}",
                              style: TextStyle(
                                fontSize: 30.0,
                                color: Color.fromARGB(255, 246, 170, 79),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              "${data.docs[index]['role']}",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color.fromARGB(255, 246, 170, 79)),
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              "${data.docs[index]['description']}",
                              style: TextStyle(
                                  fontSize: 20.0,
                                  color: Color.fromARGB(255, 246, 170, 79)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          )),
    );
  }
}
