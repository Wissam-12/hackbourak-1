import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

String nom = "Ameur";
String prenom = "Nassim";
String dateNaissance = "25 octobre 2001";
String adresseEmail = "khaled_ouali@gmail.com";
String adresseLivraison = "Cité universitaire Bouraoui Amar";
String numTel = "+213 77689344";

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 2,
          unselectedFontSize: 14,
          selectedFontSize: 14,
          selectedItemColor: Color(0xFFE32929),
          items: const [
            BottomNavigationBarItem(
                activeIcon: Icon(Icons.notifications,
                    color: Color(0xFFE32929), size: 30),
                icon: Icon(Icons.notifications,
                    color: Color(0xFF757575), size: 30),
                label: 'Notifications'),
            BottomNavigationBarItem(
                activeIcon:
                    Icon(Icons.home, color: Color(0xFFE32929), size: 30),
                icon: Icon(Icons.home, color: Color(0xFF757575), size: 30),
                label: 'Acceuil'),
            BottomNavigationBarItem(
                activeIcon: Icon(
                  Icons.account_circle,
                  color: Color(0xFFE32929),
                  size: 30,
                ),
                icon: Icon(Icons.account_circle,
                    color: Color(0xFF757575), size: 30),
                label: 'Profile')
          ]),
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Stack(children: [
            Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/img/profile_bg.png'),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(
                        0, MediaQuery.of(context).size.height / 4, 0, 0),
                    width: MediaQuery.of(context).size.width,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40)),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 20, 30, 16),
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 30),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(40),
                              border:
                                  Border.all(color: const Color(0xFFDEDEDE))),
                          child: TextButton(
                              onPressed: () {},
                              style: TextButton.styleFrom(
                                padding: EdgeInsets.zero,
                              ),
                              child: Row(
                                children: const [
                                  Icon(
                                    Icons.settings,
                                    color: Color(0xFF757575),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    'Paramètres',
                                    style: TextStyle(
                                      color: Color(0xFF3A3A3A),
                                      fontWeight: FontWeight.w500,
                                      fontSize: 14,
                                      fontFamily: 'Poppins',
                                    ),
                                  ),
                                ],
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              width: MediaQuery.of(context).size.width / 3.5,
              left: 30,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 3.0),
                    borderRadius: BorderRadius.circular(100.0)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.asset('assets/img/profile_pic.jpg'),
                ),
              ),
            ),
          ]),
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Nom & Prenom =============================================================
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                  child: Text(
                    nom + " " + prenom,
                    style: const TextStyle(
                        color: Color(0xFF3A3A3A),
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        fontFamily: 'Poppins'),
                  ),
                ),
                //Date de naissance ==========================================================
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEAEA),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Icon(
                      Icons.date_range,
                      color: Color(0xFFE32929),
                    ),
                  ),
                  title: const Text(
                    'Date de naissance',
                    style: TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  subtitle: Text(
                    dateNaissance,
                    style: const TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                //Adresse e-mail ==========================================================
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEAEA),
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: const Icon(
                      Icons.email,
                      color: Color(0xFFE32929),
                    ),
                  ),
                  title: const Text(
                    'Adresse e-mail',
                    style: TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  subtitle: Text(
                    adresseEmail,
                    style: const TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                //Adresse Livraison ==========================================================
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
                    'Adresse de livraison',
                    style: TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  subtitle: Text(
                    adresseLivraison,
                    style: const TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
                //Numero Telephone ==========================================================
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
                    'Numéro de téléphone',
                    style: TextStyle(
                        color: Color(0xFF9D9D9D),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                  subtitle: Text(
                    numTel,
                    style: const TextStyle(
                        color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        fontSize: 16),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
