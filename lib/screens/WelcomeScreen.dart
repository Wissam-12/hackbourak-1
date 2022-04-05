import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackbourak/main.dart';
import 'package:hackbourak/screens/InscriptionScreen.dart';
import 'package:hackbourak/screens/Loading.dart';
import 'package:hackbourak/screens/MapLoader.dart';
import 'package:hackbourak/screens/RestPage.dart';
import 'package:hackbourak/screens/Vousetes.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  
  User? _currentUser = null;
  bool done = false;


  FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    auth
        .authStateChanges()
        .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        setState(() {
          _currentUser = null;
        });

      } else {
        //print('User is signed in!');
        setState(() {
          _currentUser = user;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (BuildContext context, userSnapshot) {
          if (userSnapshot.hasData){
            print("entered here");
            return MapLoader();
          }else{
            return Vousetes();
          }
        }
    );
  }
}


