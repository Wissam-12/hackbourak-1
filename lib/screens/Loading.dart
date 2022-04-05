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
      backgroundColor: const Color(0xFFE32929),
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
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(90.0),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: 35.0, horizontal: 0),
              child: const Text(
                'Bienvenue !',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 46,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 3.0),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 3.0),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(119, 255, 255, 255),
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                ),
                Container(
                  margin:
                      const EdgeInsets.symmetric(vertical: 0, horizontal: 3.0),
                  width: 10,
                  height: 10,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(57, 255, 255, 255),
                    borderRadius: BorderRadius.circular(90.0),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
