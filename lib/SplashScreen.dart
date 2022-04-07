import 'package:flutter/material.dart';
import 'package:hackbourak/screens/Loading.dart';
import 'package:hackbourak/screens/WelcomeScreen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  Widget build(BuildContext context) {

    return Loading();
  }
}
