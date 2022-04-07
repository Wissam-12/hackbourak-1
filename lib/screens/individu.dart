import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../Shared/SharedFunctions.dart';
import 'signin.dart';

class IndividInfo extends StatefulWidget {
  IndividInfo({Key? key, required this.email}) : super(key: key);
String email;
  @override
  State<IndividInfo> createState() => _IndividInfoState(email: email);
}

class _IndividInfoState extends State<IndividInfo> {
    _IndividInfoState({required this.email});
  final scaffoldkey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();

  String email;
  String _password1="";
  String _password2="";
  String _name="";
  String _prenom="";
  int _year=0;
  int _number=0;

    Future<void> _signUpMailPassword() async {
        try {

            if (_password1 != _password2){
                SharedFunctions.showingToast("Mots de passe non pas identiques");
            }else{
                if (_name==""){
                    SharedFunctions.showingToast("Veuillez entrer votre nom");
                }else{
                    if (_prenom==""){
                        SharedFunctions.showingToast("Veuillez entre votre prenom");
                    }else{
                        if (_year>2014 && _year<1900){
                            SharedFunctions.showingToast("Veuillez entrer une année valide");
                        }else{
                            if (_number == 0){
                                SharedFunctions.showingToast("Veuillez entrer votre numero de telephone");
                            }else{
                                SharedFunctions.showLoaderDialog(context);

                                UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                                    email: email,
                                    password: _password1
                                );

                                FirebaseFirestore.instance.collection("users").doc(userCredential.user?.uid).set({
                                    'password': _password1,
                                    'name' : _name,
                                    'prenom' : _prenom,
                                    'phone' : _number,
                                    'year' : _year,
                                    'email' : email,
                                    'isOrg' : false,
                                });

                                Navigator.pop(context);
                                Navigator.pop(context);
                                Navigator.pop(context);
                            }
                        }
                    }
                }
            }



        } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
                SharedFunctions.showingToast('The password provided is too weak.');
                print(e.code);
            } else if (e.code == 'email-already-in-use') {
                SharedFunctions.showingToast('The account already exists for that email.');
                print(e.code);
            }

            Navigator.pop(context);
        } catch (e) {
            SharedFunctions.showingToast(e.toString());
            print(e);

            Navigator.pop(context);
        }
    }


  bool hidePassword = true;
  bool hidep = true;
  bool checked = false;
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
                                                "Inscription",
                                                style: Theme.of(context).textTheme.headline2,
                                            ),
                                            SizedBox(
                                                height: 80,
                                            ),
                                            new TextFormField(
                                                keyboardType: TextInputType.text,
                                                // validator: (input) => input.isEmpty || !input.contains("@")
                                                //     ? "enter a valid eamil"
                                                //     : null,
                                                decoration: new InputDecoration(
                                                    hintText: "Nom",
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
                                                onChanged: (val){_name = val;},
                                            ),
                                            SizedBox(height: 10,),
                                            new TextFormField(
                                                keyboardType: TextInputType.text,
                                                // validator: (input) => input.isEmpty || !input.contains("@")
                                                //     ? "enter a valid eamil"
                                                //     : null,
                                                decoration: new InputDecoration(
                                                    hintText: "Prénom",
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
                                                onChanged: (val){_prenom = val;},
                                            ),
                                            SizedBox(height: 10,),
                                            new TextFormField(
                                                keyboardType: TextInputType.number,
                                                decoration: new InputDecoration(
                                                    hintText: "Année de Naissance",
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
                                                onChanged: (val){_year = int.parse(val);},
                                            ),
                                            SizedBox(height: 10,),
                                            new TextFormField(
                                                keyboardType: TextInputType.number,
                                                decoration: new InputDecoration(
                                                    hintText: "N° de téléphone",
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
                                                onChanged: (val){_number = int.parse(val);},
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
                                                onChanged: (val){_password1 = val;},
                                            ),
                                            SizedBox(height: 10,),
                                            new TextFormField(
                                                keyboardType: TextInputType.text,
                                                // validator: (input?) => input.length < 6
                                                //     ? "Password must contains at least 6 characters"
                                                //     : null,
                                                obscureText: hidep,
                                                decoration: new InputDecoration(
                                                    hintText: "Confirmer le mot de passe",
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
                                                                hidep = !hidep;
                                                            });
                                                        },
                                                        color: Colors.black.withOpacity(0.4),
                                                        icon: Icon(
                                                            hidep?
                                                            Icons.visibility_off: Icons.visibility
                                                        ),
                                                    ),
                                                ),
                                                onChanged: (val){_password2 = val;},
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                                child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                    children: <Widget>[
                                                        Checkbox(
                                                            value: checked,
                                                            onChanged: (value) {
                                                                setState((){
                                                                checked = value ?? false;
                                                                });
                                                            },
                                                        ),
                                                        Container(
                                                            child: Text(
                                                                "J’accepte les conditions générales d’utilisation",
                                                                style: TextStyle(
                                                                    fontFamily: 'Poppins',
                                                                    color: Color(0xFF343434),
                                                                    fontSize: 10,
                                                                    fontWeight: FontWeight.w500,
                                                                )
                                                            ),
                                                        ),
                                                    ],
                                                ),
                                            ),
                                            SizedBox(height: 20,),
                                            FlatButton(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 20,
                                                ),
                                                onPressed: checked ? () {
                                                    _signUpMailPassword();
                                                } : null,
                                                child: Text(
                                                    "Inscription",
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        color: checked ? Colors.white : Color(0xFF343434),
                                                        fontFamily: 'Poppins',
                                                        fontWeight: FontWeight.w700,
                                                    ),
                                                ),
                                                color: !checked ? Color(0xFF757575) : Color(0xFFE32929),
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