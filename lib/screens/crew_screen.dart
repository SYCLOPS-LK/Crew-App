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
      color: const Color.fromARGB(255, 20, 28, 36),
      child: StreamBuilder<QuerySnapshot>(
        stream: crew,
        builder: (
          BuildContext context,
          AsyncSnapshot<QuerySnapshot> snapshot,
        ) {
          if (snapshot.hasError) {
            return Center(
              child: Text(
                "Something went wrong".toUpperCase(),
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: Color.fromARGB(255, 246, 170, 79),
                  fontWeight: FontWeight.bold,
                ),
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
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Card(
                  color: const Color.fromARGB(255, 20, 28, 36),
                  elevation: 5.0,
                  shape: const RoundedRectangleBorder(
                    side: BorderSide(
                      color: Color.fromARGB(255, 246, 170, 79),
                      width: 2.0,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(25)),
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
                              padding: const EdgeInsets.all(10.0),
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
                            const SizedBox(height: 10.0),
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
                            const SizedBox(height: 10.0),
                          ],
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  const Text(
                                    "Role: ",
                                    style: TextStyle(
                                      fontSize: 20.0,
                                      color: Color.fromARGB(255, 246, 170, 79),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${data.docs[index]['role']}",
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 246, 170, 79),
                                      ),
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
                                      color: Color.fromARGB(255, 246, 170, 79),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${data.docs[index]['email']}",
                                      textAlign: TextAlign.left,
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 246, 170, 79),
                                      ),
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
                                      color: Color.fromARGB(255, 246, 170, 79),
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "${data.docs[index]['language']}",
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        color:
                                            Color.fromARGB(255, 246, 170, 79),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 15.0),
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
      ),
    );
  }
}
