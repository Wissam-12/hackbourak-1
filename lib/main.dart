import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hackbourak/screens/EventDetails.dart';
import 'package:hackbourak/screens/Loading.dart';
import 'package:hackbourak/SplashScreen.dart';

import 'package:hackbourak/screens/RestPage.dart';

import 'package:hackbourak/screens/Vousetes.dart';
import 'package:hackbourak/screens/WelcomeScreen.dart';

import 'firebase_options.dart';
import 'screens/signin.dart';
import 'screens/organisation.dart';
import 'screens/new_event.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Hackbourak',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Colors.white,
          floatingActionButtonTheme: FloatingActionButtonThemeData(
            elevation: 0,
            foregroundColor: Colors.white,
          ),
          accentColor: Color(0xFFE32929),
          textTheme: TextTheme(
            headline1: TextStyle(
              fontSize: 22.0,
              color: Color(0xFFE32929),
            ),
            headline2: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.w700,
              color: Color(0xFF343434),
            ),
            bodyText1: TextStyle(
              fontSize: 14.0,
              fontWeight: FontWeight.w400,
              color: Color(0xFFE32929),
            ),
          ),
        ),

        accentColor: Color(0xFFE32929),
        textTheme: TextTheme(
          headline1: TextStyle(fontSize: 22.0, color: Color(0xFFE32929),),
          headline2: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w700, color: Color(0xFF343434),),
          bodyText1: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w400, color: Color(0xFFE32929),),
        ),
<<<<<<< HEAD
      ),
      home: NewEventPage(),

      home: FutureBuilder(
        future: Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return WelcomeScreen();
          }
          return SplashScreen();
        },
      )
=======
      ),=

        home: MyHomePage(title: 'hey',),
>>>>>>> 6aa48723ae939492752eb21a01ee2c15ebd8a713
    );

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _accessMap() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => RestPage()));
  }

  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => RestPage(),
        ),
      );
    }
    return firebaseApp;
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initializeFirebase(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return WelcomeScreen();
        }
        return SplashScreen();
      },
    );

  }
}
