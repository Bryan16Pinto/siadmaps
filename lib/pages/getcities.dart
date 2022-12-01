import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:siadmaps/pages/geolocation.dart';
import 'package:url_launcher/url_launcher.dart';

class getCities extends StatelessWidget {
  const getCities({super.key, required this.documentId});
  final String documentId;
  @override
  Widget build(BuildContext context) {
    CollectionReference cities =
        FirebaseFirestore.instance.collection("cities");
    return FutureBuilder<DocumentSnapshot>(
      future: cities.doc(documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;
          //return Text('Nombre: ${data['nombre']}');
          return CupertinoButton(
            onPressed: () async {
              // Navigator.of(context).push(
              //   MaterialPageRoute(
              //     builder: (context) => const Geolocation(),
              //   ),
              // );
  // Uri url =
  //     Uri.parse('google.navigation:q=25.5529552,131.5435473');
  Uri fallbackUrl = Uri.parse('${data['localizacion']}');

  try {
   // bool launched = await launchUrl(url);
    //if (!launched) {
      await launchUrl(fallbackUrl);
    //}
  } catch (e) {
    await launchUrl(fallbackUrl);
  }
            },
            child: Container(
              decoration: BoxDecoration(color: Colors.black12),
              child: Column(
                children: [
                  Image.network('${data['foto']}'),
                  Text('${data['nombre']}'),
                  Text('${data['descripcion']}'),
                  RatingBar.builder(
                    initialRating:  data['puntuacion'].toString()=="5" ? 5.0 :  data['puntuacion'].toString()=="4"?4.0:  data['puntuacion'].toString()=="3"?3.0:  data['puntuacion'].toString()=="2"?2.0:  data['puntuacion'].toString()=="1"?1.0:0.0,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                ],
              ),
            ),
          );
        }
        return Text("Loading...");
      },
    );
  }
}
