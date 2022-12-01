import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:siadmaps/pages/registro.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
TextEditingController correo = TextEditingController();
TextEditingController pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          children: [
            Text("Iniciar sesión"),
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
            CupertinoButton(child: Text("Entrar"), onPressed: () async {
              try {
  final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: correo.text,
    password: pass.text
  );
} on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found') {
    print('No user found for that email.');
  } else if (e.code == 'wrong-password') {
    print('Wrong password provided for that user.');
  }
}
            }),
            CupertinoButton(child: Text("Registrarse"), onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const Registro(),
                ),
              );
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