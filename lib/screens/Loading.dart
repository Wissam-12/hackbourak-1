import 'package:flutter/material.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/loading_bg.png'),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/img/ftournet.png'),
            // Container(
            //   margin: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 0),
            //   child: const Text(
            //     'Bienvenue !',
            //     style: TextStyle(
            //         color: Color(0xFF343434),
            //         fontWeight: FontWeight.w700,
            //         fontSize: 46,
            //         fontFamily: 'Poppins'),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 60, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 3.0),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color(0xFFE32929),
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 3.0),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(184, 227, 41, 41),
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 0, horizontal: 3.0),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(84, 227, 41, 41),
                      borderRadius: BorderRadius.circular(90.0),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
