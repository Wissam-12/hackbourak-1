import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackbourak/main.dart';
import 'package:hackbourak/screens/InscriptionScreen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  
  User? _currentUser = null;
  
  @override
  Widget build(BuildContext context) {

    FirebaseAuth.instance
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        setState(() {
          _currentUser = user;
        });

      } else {
        print('User is signed in!');
        setState(() {
          _currentUser = user;
        });
      }
    });

    return _currentUser == null ? Scaffold(
      body: Container(
        child: Center(
          child: ElevatedButton(
            onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) => const InscriptionScreen())); },
            child: Text("Acceder a la page d'inscription"),

          ),
        ),
      ),
    ) : MyHomePage(title: 'ho');
  }
}


