import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../Shared/SharedFunctions.dart';

class ConnexionPage extends StatefulWidget {
  ConnexionPage({Key? key}) : super(key: key);

  @override
  State<ConnexionPage> createState() => _ConnexionPageState();
}

class _ConnexionPageState extends State<ConnexionPage> {

    Future<void> _signInMailPassword() async {
        try {
            SharedFunctions.showLoaderDialog(context);

            UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                email: _email,
                password: _password
            );
            Navigator.pop(context);
            Navigator.pop(context);
            Navigator.pop(context);
        } on FirebaseAuthException catch (e) {
            if (e.code == 'user-not-found') {
                print('No user found for that email.');
                SharedFunctions.showingToast('No user found for that email.');
            } else if (e.code == 'wrong-password') {
                print('Wrong password provided for that user.');
                SharedFunctions.showingToast('Wrong password provided for that user.');
            }

            Navigator.pop(context);
        }
    }
    String _email = "";
    String _password="";


    final scaffoldkey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
  bool hidePassword = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldkey,
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
            child: Column(
                children: <Widget>[
                    Stack(
                        children: <Widget>[
                            Container(
                                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15,),
                                margin: EdgeInsets.symmetric(vertical: 80, horizontal: 20,),
                                child: Form(
                                    key: globalFormKey,
                                    child: Column(
                                        children: <Widget>[
                                            SizedBox(height: 10),
                                            Container(
                                                alignment: Alignment.topLeft,
                                                child: IconButton(
                                                    onPressed: (){
                                                        Navigator.pop(context);
                                                    },
                                                    icon : Icon(Icons.arrow_back_ios_rounded, color: Color(0xFF757575),),
                                                ),
                                            ),
                                            Text(
                                                "Connextion",
                                                style: Theme.of(context).textTheme.headline2,
                                            ),
                                            SizedBox(
                                                height: 80,
                                            ),
                                            TextFormField(
                                                keyboardType: TextInputType.emailAddress,
                                                // validator: (input) => input.isEmpty || !input.contains("@")
                                                //     ? "enter a valid eamil"
                                                //     : null,
                                                decoration: InputDecoration(
                                                    hintText: "Adresse Email",
                                                    hintStyle: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w500,
                                                    ),
                                                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20,),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(0xFF757575),
                                                        ),
                                                        borderRadius: BorderRadius.circular(23.5)
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.black,),
                                                        borderRadius: BorderRadius.circular(23.5)
                                                    ),
                                                ),
                                                onChanged: (value){
                                                    _email = value;
                                                },
                                            ),
                                            SizedBox(height: 10,),
                                            new TextFormField(
                                                keyboardType: TextInputType.text,
                                                // validator: (input?) => input.length < 6
                                                //     ? "Password must contains at least 6 characters"
                                                //     : null,
                                                obscureText: hidePassword,
                                                decoration: new InputDecoration(
                                                    hintText: "Mot de passe",
                                                    hintStyle: TextStyle(
                                                        fontSize: 16,
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w500,
                                                    ),
                                                    contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 20,),
                                                    enabledBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(0xFF757575),
                                                        ),
                                                        borderRadius: BorderRadius.circular(23.5)
                                                    ),
                                                    focusedBorder: OutlineInputBorder(
                                                        borderSide: BorderSide(color: Colors.black,),
                                                        borderRadius: BorderRadius.circular(23.5)
                                                    ),
                                                    suffixIcon: IconButton(
                                                        onPressed: () {
                                                            setState((){
                                                                hidePassword = !hidePassword;
                                                            });
                                                        },
                                                        color: Colors.black.withOpacity(0.4),
                                                        icon: Icon(
                                                            hidePassword?
                                                            Icons.visibility_off: Icons.visibility
                                                        ),
                                                    ),
                                                ),
                                                onChanged: (value){
                                                    _password = value;
                                                },
                                            ),
                                            TextButton(
                                                onPressed: () {

                                                },
                                                child: Text(
                                                    "Mot de passe oublié ?",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'Poppins',
                                                        fontSize: 12,
                                                        color: Color(0xFF343434),
                                                        fontWeight: FontWeight.w500,
                                                    ),
                                                ),
                                            ),
                                            SizedBox(height: 20,),
                                            FlatButton(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 20,
                                                ),
                                                onPressed: () {_signInMailPassword();},
                                                child: Text("Connextion", style: TextStyle(fontSize: 18, color: Colors.white,),),
                                                color: Theme.of(context).accentColor,
                                                shape: StadiumBorder(),
                                            ),
                                        ],
                                    ),
                                ),
                            ),
                        ],
                    ),
                ],
            ),
        ),
    );
  }
}