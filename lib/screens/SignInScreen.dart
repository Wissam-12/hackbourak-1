import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hackbourak/Shared/SharedFunctions.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {

  Future<void> _signInMailPassword() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: _email,
          password: _password
      );
      Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        SharedFunctions.showingToast('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        SharedFunctions.showingToast('Wrong password provided for that user.');
      }
    }
  }
  String _email = "";
  String _password="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

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
                onPressed: _signInMailPassword,
                child: Text('Se connecter'),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
