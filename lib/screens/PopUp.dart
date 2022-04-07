import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class PopUp extends StatefulWidget {
  const PopUp({Key? key}) : super(key: key);

  @override
  State<PopUp> createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  final _text = TextEditingController();
  bool _validate = false;

  @override
  void dispose() {
    _text.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          height: MediaQuery.of(context).size.height / 2,
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(vertical: 0, horizontal: 30),
          padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Column(
            children: [
              const Text(
                'Feedback',
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: 26,
                    fontFamily: 'Poppins'),
              ),
              SizedBox(height: 5),
              const Text(
                "Décrivez brièvement votre expérience au sein de cet événement. Comment ça s’est passé? Sont les objectifs de l’événement atteints? Avez-vous rencontré des problèmes?",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    fontSize: 14,
                    fontFamily: 'Poppins'),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    //Super! ==========================================
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          setState(() {
                            _text.text = "Super!";
                            //Send function here ------------
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 2),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEAEA),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Super!',
                            style: TextStyle(
                              color: Color(0xFFC91C1C),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        )),
                    //Très bien! ==========================================
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          setState(() {
                            _text.text = "Très Bien!";
                            //Send function here ------------
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 2),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEAEA),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Très bien!',
                            style: TextStyle(
                              color: Color(0xFFC91C1C),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        )),
                    //Moyen ==========================================
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          setState(() {
                            _text.text = "Moyen";
                            //Send function here ------------
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 2),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEAEA),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Moyen',
                            style: TextStyle(
                              color: Color(0xFFC91C1C),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        )),
                    //Problème rencontré ==========================================
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          if (_text.text.isEmpty) {
                            setState(() {
                              _validate = true;
                            });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 2),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEAEA),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Problème rencontré',
                            style: TextStyle(
                              color: Color(0xFFC91C1C),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        )),
                    //Affreux ==========================================
                    TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          if (_text.text.isEmpty) {
                            setState(() {
                              _validate = true;
                            });
                          }
                        },
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 5, horizontal: 2),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10, horizontal: 15),
                          decoration: BoxDecoration(
                            color: const Color(0xFFFFEAEA),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Text(
                            'Affreux',
                            style: TextStyle(
                              color: Color(0xFFC91C1C),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                            ),
                          ),
                        )),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 30),
                padding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.grey.withOpacity(0.5),
                //       spreadRadius: 5,
                //       blurRadius: 7,
                //       offset: Offset(0, 3), // changes position of shadow
                //     ),
                //   ],
                // ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _text,
                        decoration: InputDecoration(
                          hintText: "Ecrivez votre texte ici",
                          errorText: _validate
                              ? 'Veuillez spécifier vos réclamations ici'
                              : null,
                        ),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          if (_text.text.isEmpty) {
                            setState(() {
                              _validate = true;
                            });
                          } else {
                            _validate = false;
                            //Send Function Here -------------------------
                          }
                        },
                        icon: const RotationTransition(
                          turns: AlwaysStoppedAnimation(-45 / 360),
                          child: Icon(
                            Icons.send,
                            color: Color(0xFF1AE4A6),
                            size: 40,
                          ),
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      );

  }
}
