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
    return Container(
        padding: const EdgeInsets.fromLTRB(15.0, 10.0, 15.0, 0.0),
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
              return Center(
                child: Text(
                  "Retrieving data form the database".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 20.0,
                    color: Color.fromARGB(255, 246, 170, 79),
                    fontWeight: FontWeight.bold,
                  ),
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
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Column(
                            children: [
                              Container(
                                height: 120.0,
                                width: 120.0,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        data.docs[index]['image_link']),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              Text(
                                "${data.docs[index]['name']}".toUpperCase(),
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 30.0,
                                  color: Color.fromARGB(255, 246, 170, 79),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "${data.docs[index]['code_name']}",
                                style: const TextStyle(
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color.fromARGB(255, 246, 170, 79),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(top: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "Role: ",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 246, 170, 79),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${data.docs[index]['role']}",
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 246, 170, 79),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Email: ",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 246, 170, 79),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${data.docs[index]['email']}",
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 246, 170, 79),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      "Languages: ",
                                      style: TextStyle(
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 246, 170, 79),
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "${data.docs[index]['language']}",
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 246, 170, 79),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 8.0),
                                Text(
                                  "${data.docs[index]['description']}",
                                  textAlign: TextAlign.justify,
                                  style: const TextStyle(
                                    fontSize: 20.0,
                                    color: Color.fromARGB(255, 246, 170, 79),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ));
  }
}
