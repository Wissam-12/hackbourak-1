import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackbourak/screens/RestPage.dart';

class MapLoader extends StatefulWidget {
  const MapLoader({Key? key}) : super(key: key);

  @override
  State<MapLoader> createState() => _MapLoaderState();
}

class _MapLoaderState extends State<MapLoader> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
              builder: (BuildContext context) => RestPage()
          )
      );
    });

  }

  @override
  Widget build(BuildContext context) {
    

    
    return Scaffold(
      backgroundColor: const Color(0xFFE32929),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/loading_bg.png'),
          ),
        ),
        child: Center(child: CircularProgressIndicator(color: Colors.white,)),
      ),
    );
  }
}
