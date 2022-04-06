
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hackbourak/screens/EventDetails.dart';

class RestaurantSmallDetails extends StatefulWidget {
  RestaurantSmallDetails({Key? key, required this.timestamp, required this.docRef,required this.name, required this.location, required this.places, required this.interested}) : super(key: key);

  String name;
  GeoPoint location ;
  int places;
  int interested;
  String docRef;
  Timestamp timestamp;
  @override
  State<RestaurantSmallDetails> createState() => _RestaurantSmallDetailsState(timestamp: timestamp, docRef : docRef,name : name, location: location, places: places, interested: interested);
}

class _RestaurantSmallDetailsState extends State<RestaurantSmallDetails> {

  _RestaurantSmallDetailsState({required this.timestamp,required this.docRef, required this.name, required this.location, required this.places, required this.interested});

  String docRef;
  int places;
  int interested;

  String name= "";
  GeoPoint location ;
  Timestamp timestamp;

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
    return Column(
      children: [
        SizedBox(height: 15,),
        Image.asset('assets/swipe_indicator.png'),
        SizedBox(height: 15,),
        Row(
          children: [
            SizedBox(width: 30,),
            Image.asset('assets/org.png'),
            SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FutureBuilder(future: _getName(docRef), initialData: "Chargement du nom...",
                    builder: (BuildContext context, AsyncSnapshot<String> text){
                      return Text(text.data==null ? "" : text.data!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),);
                    }
                ),
                FutureBuilder(future: _getType(docRef), initialData: "Chargement du type...",
                    builder: (BuildContext context, AsyncSnapshot<String> text){
                      return Text(text.data==null ? "" : text.data!, style: TextStyle(fontSize: 14),);
                    }
                ),
              ],
            ),

          ],
        ),
        SizedBox(height: 5,),
        Container(
          margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Row(
                    children: [
                      !expaned ? Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                              color: !expaned ? Color(0xFFFFEAEA) : Color(0x00FFFFFF),
                              borderRadius: BorderRadius.circular(100)
                          ),
                          child: Icon(Icons.location_on_outlined, size: 30,color: !expaned ? Color(0xFFE32929) : Color(0x00FFFFFF),
                          )
                      ): SizedBox.shrink(),

                      Column(
                        children: [
                          Container(
                              margin: EdgeInsets.all(10),
                              child: Text(name, style: TextStyle(fontWeight: !expaned ? FontWeight.w500 : FontWeight.w700, fontSize: !expaned ? 20 : 22),)),
                        ],
                      ),
                    ],
                  ),


                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Color(0xFFE32929),
                    ),
                    child: IconButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetails(name: name, location: location, docRef: docRef, interested: interested, timestamp: timestamp, places: places,)));
                      },
                      icon: Icon(Icons.keyboard_arrow_right), color: Colors.white,),
                  )


                ],
              ),

              !expaned ? SizedBox.shrink() : Column(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFFEAEA),
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.location_on_outlined, size: 25,color:Color(0xFFE32929),),
                                    ],
                                  )
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Adresse', style: TextStyle(color: Color(0xFF9D9D9D)),),
                                  FutureBuilder(future: _getAddress(location), initialData: "Chargement de l'adresse...",
                                      builder: (BuildContext context, AsyncSnapshot<String> text){
                                        return Text(text.data==null ? "" : text.data!);
                                      }
                                  ),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFFEAEA),
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.fastfood_outlined, size: 25,color:Color(0xFFE32929),),
                                    ],
                                  )
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Nombre de plats offerts', style: TextStyle(color: Color(0xFF9D9D9D)),),
                                  Text(places.toString()),
                                ],
                              ),
                            ],
                          ),

                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.fromLTRB(15, 0, 15, 0),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFFFEAEA),
                                      borderRadius: BorderRadius.circular(100)
                                  ),
                                  child: Row(
                                    children: [
                                      Icon(Icons.people_alt_outlined, size: 25,color:Color(0xFFE32929),),
                                    ],
                                  )
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Nombre de personnes interessées', style: TextStyle(color: Color(0xFF9D9D9D)),),
                                  Text(interested.toString()),

                                ],
                              ),
                            ],
                          ),

                        ],
                      ),

                    ],
                  )
                ],
              ),





            ],
          ),
        ),
      ],
    );
  }
}



