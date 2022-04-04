
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../main.dart';

class InscriptionScreen extends StatefulWidget {
  const InscriptionScreen({Key? key}) : super(key: key);

  @override
  State<InscriptionScreen> createState() => _InscriptionScreenState();
}

class _InscriptionScreenState extends State<InscriptionScreen> {

  void ShowingToast(String message){
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0
    );
  }

  String _email = "";
  String _password = "";

  Future<void> _signUpMailPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _password
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        ShowingToast('The password provided is too weak.');
        print(e.code);
      } else if (e.code == 'email-already-in-use') {
        ShowingToast('The account already exists for that email.');
        print(e.code);
      }
    } catch (e) {
      ShowingToast(e.toString());
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              ElevatedButton(
                  onPressed: () {

                  },
                  child: Text('Continuer avec Facebook'),
              ),

              ElevatedButton(
                onPressed: () {

                },
                child: Text('Continuer avec Google'),
              ),

              Text('Ou'),

              TextField(
                decoration: InputDecoration(
                  hintText: "Adresse Email",
                    contentPadding: const EdgeInsets.all(15),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)),
                ),
                onChanged: (value){
                  setState(() {
                    _email = value;
                    print(_email);
                  });
                },
              ),

              TextField(
                decoration: InputDecoration(
                  hintText: "Mot de passe",
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                ),
                onChanged: (value){
                  setState(() {
                    _password = value;
                    print(_password);
                  });
                },
              ),

              ElevatedButton(
                onPressed: _signUpMailPassword,
                child: Text('Suivant'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
