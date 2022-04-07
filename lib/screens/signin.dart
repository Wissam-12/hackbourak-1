import 'package:flutter/material.dart';
import 'package:hackbourak/Shared/SharedFunctions.dart';
import 'individu.dart';
import 'connexion.dart';

class SigninPage extends StatefulWidget {
  SigninPage({Key? key}) : super(key: key);

  @override
  State<SigninPage> createState() => _SigninPageState();
}

class _SigninPageState extends State<SigninPage> {
  final scaffoldkey = GlobalKey<ScaffoldState>();
  String _email = "";
  GlobalKey<FormState> globalFormKey = new GlobalKey<FormState>();
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
                                            Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Color(0xFF757575),
                                                    ),
                                                    borderRadius: BorderRadius.all(Radius.circular(50),),
                                                ),
                                                child: FloatingActionButton.extended(
                                                    label: Text(
                                                        'Continuez avec Google',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            fontFamily: 'Poppins',
                                                            fontWeight: FontWeight.w500,
                                                            color: Color(0xFF757575),
                                                            letterSpacing: 0.0
                                                        )
                                                    ),
                                                    onPressed: () {},
                                                    icon : Image.asset(
                                                        'assets/img/google.png',
                                                        height: 32,
                                                        width: 32,
                                                    ),
                                                    backgroundColor: Colors.white,
                                                ),
                                            ),
                                            SizedBox(height: 10,),
                                            Container(
                                                child: Text(
                                                    'ou',
                                                    style: TextStyle(fontSize: 18, color: Color(0xFF757575),),
                                                ),
                                            ),
                                            SizedBox(height: 10,),
                                            TextFormField(
                                                keyboardType: TextInputType.emailAddress,
                                                // validator: (input) => input.isEmpty || !input.contains("@")
                                                //     ? "enter a valid eamil"
                                                //     : null,
                                                decoration: new InputDecoration(
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
                                                onChanged: (val){
                                                    _email = val;
                                                },
                                            ),
                                            SizedBox(height: 20,),
                                            FlatButton(
                                                padding: EdgeInsets.symmetric(
                                                    vertical: 5,
                                                    horizontal: 20,
                                                ),
                                                onPressed: () {

                                                    if (_email != ""){
                                                        Navigator.push(
                                                            context,
                                                            MaterialPageRoute(builder: (context) => IndividInfo(email: _email,)
                                                            ),
                                                        );
                                                    }else{
                                                        SharedFunctions.showingToast("Veuillez entrer votre email.");
                                                    }


                                                },
                                                child: Text("Suivant", style: TextStyle(fontSize: 18, color: Colors.white,),),
                                                color: Theme.of(context).accentColor,
                                                shape: StadiumBorder(),
                                            ),
                                            SizedBox(height: 80,),
                                            TextButton(
                                                onPressed: () {
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(builder: (context) => ConnexionPage()
                                                        ),
                                                    );
                                                },
                                                child: Text(
                                                    "Vous avez déjà un compte?\n Connectez-vous!",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: Theme.of(context).accentColor,
                                                    ),
                                                ),
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