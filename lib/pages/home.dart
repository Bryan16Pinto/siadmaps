import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:siadmaps/pages/getcities.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<String> docsID = [];

  @override
  Widget build(BuildContext context) {
    Future getDocId() async {
      await FirebaseFirestore.instance
          .collection("cities")
          .get()
          .then((snapshot) => snapshot.docs.forEach((element) {
                print(element.reference);
                docsID.add(element.reference.id);
              }));
    }

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.exit_to_app),
        onPressed: () async { 
              await FirebaseAuth.instance.signOut();
        },
      ),
        body: SafeArea(
          child: Column(
            children: [
              Text("Visitar lugares",style: TextStyle(fontSize: 25),),
              Expanded(
                child: FutureBuilder(
                    future: getDocId(),
                    builder: ((context, snapshot) {
                      return ListView.builder(
                        itemCount: docsID.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            title: getCities(documentId: docsID[index],)
                          );
                        }),
                      );
                    })),
              ),
            ],
          ),
        ));
  }


// Future <void> _openmap(String lat, String lon) async {
//   String googleurl="https://www.google.com/maps/search/?api=1&query=$lat,$lon";
//   await canLaunchUrlString(googleurl) ? await launchUrlString(googleurl): throw   "could not launch $googleurl";
// }
}

class GetUserName extends StatelessWidget {
  final String documentId;

  GetUserName(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data!.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          return Text("Full Name: ${data['correo']} ${data['contrasena']}");
        }

        return Text("loading");
      },
    );
  }
}
