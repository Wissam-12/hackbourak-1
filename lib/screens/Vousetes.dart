import 'package:flutter/material.dart';

class Vousetes extends StatefulWidget {
  const Vousetes({Key? key}) : super(key: key);

  @override
  State<Vousetes> createState() => _VousetesState();
}

class _VousetesState extends State<Vousetes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFFE32929),
        body: Container(
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/loading_bg.png'),
            ),
          ),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 0.0, horizontal: 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Vous êtes ...',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: 36,
                  ),
                ),
                Column(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 50.0),
                      margin: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 0.0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Un individu',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 2.0),
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 5.0, horizontal: 50.0),
                      margin: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 0.0),
                      child: TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Une organisation',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 26,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 70),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
