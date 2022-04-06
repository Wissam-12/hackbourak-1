import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';

class EventDetails extends StatefulWidget {
  EventDetails({Key? key, required this.docRef,required this.timestamp,required this.name, required this.location, required this.places, required this.interested}) : super(key: key);

  String name;
  GeoPoint location ;
  int places;
  int interested;
  Timestamp timestamp;
  String docRef;


  @override
  State<EventDetails> createState() => _EventDetailsState(docRef: docRef, timestamp: timestamp, name : name, location: location, places: places, interested: interested);
}

class _EventDetailsState extends State<EventDetails> {
  _EventDetailsState({required this.timestamp, required this.docRef, required this.name, required this.location, required this.places, required this.interested});

  String name;
  GeoPoint location ;
  int places;
  int interested;
  Timestamp timestamp;
  String docRef;

  Future<String> _getAddress(GeoPoint g) async {
    if (g.latitude == null || g.longitude == null) return "";
    GeoCode geoCode = GeoCode();
    Address address = await geoCode.reverseGeocoding(latitude: g.latitude, longitude: g.longitude);



    return "${address.streetAddress}, ${address.city}";
  }

  bool expaned = true;

  Future<String> _getName(String id) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    String name = '';

    await users.doc(id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        name = documentSnapshot['name'];
        print(name);
      }else{
        print('not found');
      }
    });

    return name;
  }

  Future<String> _getType(String id) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    bool name = false;

    await users.doc(id)
        .get()
        .then((DocumentSnapshot documentSnapshot) {
      if (documentSnapshot.exists) {
        name = documentSnapshot['isOrg'];
        print(name);
      }else{
        print('not found');
      }
    });

    return name ? "Organisation" : "Individu";
  }

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
                    fit: BoxFit.fill)),
            child: Column(
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: (){Navigator.pop(context);},
                      child : Container(
                          padding: EdgeInsets.all(10),
                          child: Icon(Icons.close, color: Colors.white, size: 35,)
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.fromLTRB(
                      0, MediaQuery.of(context).size.height / 4, 0, 0),
                  width: MediaQuery.of(context).size.width,
                  height: 20,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40),
                        topRight: Radius.circular(40)),
                  ),
                ),
              ],
            ),
          ),
          //Titre ==========================================================================
          Container(
            padding: const EdgeInsets.fromLTRB(30, 10, 30, 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



                Text(
                  name,
                  style: TextStyle(
                      color: Color(0xFFE32929),
                      fontWeight: FontWeight.w700,
                      fontSize: 24,
                      fontFamily: 'Poppins'),
                ),
                ListTile(
                  contentPadding: const EdgeInsets.all(0.0),
                  leading: Image.asset('assets/img/resto_avatar.png'),
                  title:
                  FutureBuilder(future: _getName(docRef), initialData: "Chargement du nom...",
                      builder: (BuildContext context, AsyncSnapshot<String> text){
                        return Text(text.data==null ? "" : text.data!, style: TextStyle(
                            color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                        fontSize: 18),);
                      }
                  ),
                  subtitle:
                  FutureBuilder(future: _getType(docRef), initialData: "Chargement du type...",
                      builder: (BuildContext context, AsyncSnapshot<String> text){
                        return Text(text.data==null ? "" : text.data!, style: TextStyle(
                            color: Color(0xFF1E1E1E),
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                        fontSize: 14),);
                      }
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
                  subtitle: Text(
                    DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch).toString(),
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
                  subtitle:
                  FutureBuilder(future: _getAddress(location), initialData: "Chargement de l'adresse...",
                      builder: (BuildContext context, AsyncSnapshot<String> text){
                        return Text(text.data==null ? "" : text.data!, style: TextStyle(
                            color: Color(0xFF1E1E1E),
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w400,
                            fontSize: 16
                        ));

                      }
                  )),

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
                  subtitle: Text(
                    places.toString()+' plats',
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
                  subtitle: Text(
                    interested.toString()+' personnes',
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
