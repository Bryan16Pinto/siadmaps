import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:siadmaps/pages/home.dart';
import 'package:siadmaps/pages/login.dart';

class Registro extends StatefulWidget {
  const Registro({Key? key}) : super(key: key);

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  
TextEditingController correo = TextEditingController();
TextEditingController pass = TextEditingController();
FirebaseFirestore db = FirebaseFirestore.instance;

final user = <String, dynamic>{
  "first": "Ada",
  "last": "Lovelace",
  "born": 1815
};

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text("Registrate"),
            TextField(
              controller: correo,
              decoration: InputDecoration(
              hintText: "Correo"
            )),
            TextField(
              controller: pass,
              decoration: InputDecoration(
              hintText: "Contraseña"
            ),
            ),
            CupertinoButton(child: Text("Registrar"), onPressed: () async {
              try {
  final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: correo.text,
    password: pass.text,
  );
  try {
    final data = {"correo": correo.text, "contrasena": pass.text};

db.collection("users").add(data).then((documentSnapshot) =>
    print("Added Data with ID: ${documentSnapshot.id}"));
  } catch (e) {
    print('Error al guardar firestore data');
  }
} on FirebaseAuthException catch (e) {
  if (e.code == 'weak-password') {
    print('The password provided is too weak.');
  } else if (e.code == 'email-already-in-use') {
    print('The account already exists for that email.');
  }
} catch (e) {
  print(e);
}
            })
          ],
        ),
      ),
    ),
    //  body: StreamBuilder(
    //   stream: FirebaseAuth.instance.authStateChanges(),
    //   builder:  (context, snapshot){
    //     if (snapshot.hasData) {
    //       return Home();
    //     }else{
    //       return Login();
    //     }
    //   }
      
    //   ),
   );
  }
}