import 'package:flutter/material.dart';

class EventDetails extends StatefulWidget {
  const EventDetails({Key? key}) : super(key: key);

  @override
  State<EventDetails> createState() => _EventDetailsState();
}

class _EventDetailsState extends State<EventDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(vertical: 8, horizontal: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Color(0xFFD1D1D1)),
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40.0),
            topRight: Radius.circular(40.0),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            FloatingActionButton(
              backgroundColor: Color(0xFFFFEAEA),
              onPressed: () {},
              child:
                  Container(child: Icon(Icons.share, color: Color(0xFFE32929))),
            ),
            FloatingActionButton(
              backgroundColor: Color(0xFFFFEAEA),
              onPressed: () {},
              child:
                  Container(child: Icon(Icons.save, color: Color(0xFFE32929))),
            ),
            FloatingActionButton.extended(
              backgroundColor: Color(0xFFFFEAEA),
              onPressed: () {},
              label: Container(
                  child: Row(
                children: const [
                  Text(
                    'Je suis intéressé',
                    style: TextStyle(
                      color: Color(0xFFE32929),
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                    ),
                  )
                ],
              )),
            )
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/img/resto.png'),
                    fit: BoxFit.fitWidth)),
            child: Container(
              margin: EdgeInsets.fromLTRB(
                  0, MediaQuery.of(context).size.height / 4, 0, 0),
              width: MediaQuery.of(context).size.width,
              height: 35,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40),
                    topRight: Radius.circular(40)),
              ),
            ),
          ),
          //Titre ==========================================================================
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Mataam Errahma',
                  style: TextStyle(
                      color: Color(0xFFE32929),
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      fontFamily: 'Poppins'),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  leading: Image.asset('assets/img/resto_avatar.png'),
                  title: const Text(
                    'Une chorba pour tous',
                    style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18),
                  ),
                  subtitle: const Text(
                    'Association',
                    style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14),
                  ),
                ),
                //A propos ===================================================================
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 0.0),
                  child: const Text(
                    'A propos',
                    style: TextStyle(
                        color: Color(0xFFE32929),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
                const Text(
                  'Pendant tout le mois, nous accueillerons les bénéficiaires pour la prise des repas à table pour la rupture du jeûne (iftar) aux alentours de 20h30. Nous espérons pouvoir accueillir plus de 700 bénéficiaires par jour... ',
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: 16),
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0.0),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Afficher plus',
                          style: TextStyle(
                              color: Color(0xFFE32929),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.chevron_right,
                            color: Color(0xFFE32929),
                          ),
                        )
                      ],
                    )),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 0.0),
                  child: const Text(
                    'Détails',
                    style: TextStyle(
                        color: Color(0xFFE32929),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
                //Date & Heure ==========================================================
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEAEA),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Icon(
                      Icons.timer,
                      color: Color(0xFFE32929),
                    ),
                  ),
                  title: const Text(
                    'Date & Heure',
                    style: TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  subtitle: const Text(
                    'Jeudi 10 Janvier, 19:30',
                    style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                //Adresse ==========================================================
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEAEA),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Icon(
                      Icons.location_pin,
                      color: Color(0xFFE32929),
                    ),
                  ),
                  title: const Text(
                    'Adresse',
                    style: TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  subtitle: const Text(
                    'El Harrach, Alger',
                    style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                //Nombre de plats disponibles ==========================================================
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEAEA),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Icon(
                      Icons.fastfood,
                      color: Color(0xFFE32929),
                    ),
                  ),
                  title: const Text(
                    'Nombre de plats disponibles',
                    style: TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  subtitle: const Text(
                    '50 plats',
                    style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                //Capacité maximale ==========================================================
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEAEA),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Icon(
                      Icons.people,
                      color: Color(0xFFE32929),
                    ),
                  ),
                  title: const Text(
                    'Capacité maximale',
                    style: TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  subtitle: const Text(
                    '100 personnes',
                    style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                //Nombre de personnes intéressées ==========================================================
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEAEA),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Icon(
                      Icons.people,
                      color: Color(0xFFE32929),
                    ),
                  ),
                  title: const Text(
                    'Nombre de personnes intéressées',
                    style: TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  subtitle: const Text(
                    '20 personnes',
                    style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                //Nombre de personnes sur place ==========================================================
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEAEA),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Icon(
                      Icons.people,
                      color: Color(0xFFE32929),
                    ),
                  ),
                  title: const Text(
                    'Nombre de personnes sur place',
                    style: TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  subtitle: const Text(
                    '10 personnes',
                    style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                //Contact ==========================================================
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEAEA),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Icon(
                      Icons.phone,
                      color: Color(0xFFE32929),
                    ),
                  ),
                  title: const Text(
                    'Contact',
                    style: TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  subtitle: const Text(
                    '+213 77689344',
                    style: TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                //A propos de l'organisateur ===================================================================
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 0.0),
                  child: const Text(
                    "A propos de l'organisateur",
                    style: TextStyle(
                        color: Color(0xFFE32929),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
                const Text(
                  "L'association UNE CHORBA POUR TOUS est composée d'un conseil d'administration de 7 membres dont 4 constituent le bureau,...",
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w300,
                      fontSize: 16),
                ),
                TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      padding: const EdgeInsets.all(0.0),
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Afficher plus',
                          style: TextStyle(
                              color: Color(0xFFE32929),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                        RotatedBox(
                          quarterTurns: 1,
                          child: Icon(
                            Icons.chevron_right,
                            color: Color(0xFFE32929),
                          ),
                        )
                      ],
                    )),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
