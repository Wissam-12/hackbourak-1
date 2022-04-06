
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';
import 'package:hackbourak/screens/EventDetails.dart';

class RestaurantCard extends StatefulWidget {
  RestaurantCard({Key? key, required this.docRef,required this.timestamp,required this.name, required this.location, required this.places, required this.interested}) : super(key: key);

  String name;
  GeoPoint location ;
  int places;
  int interested;
  Timestamp timestamp;
  String docRef;
  @override
  State<RestaurantCard> createState() => _RestaurantCardState(docRef: docRef, timestamp: timestamp, name : name, location: location, places: places, interested: interested);
}

class _RestaurantCardState extends State<RestaurantCard> {

  _RestaurantCardState({required this.timestamp, required this.docRef, required this.name, required this.location, required this.places, required this.interested});

  int places;
  int interested;
  Timestamp timestamp;
  String docRef;


  String name= "";
  GeoPoint location ;

  Future<String> _getAddress(GeoPoint g) async {
    if (g.latitude == null || g.longitude == null) return "";
    GeoCode geoCode = GeoCode();
    Address address = await geoCode.reverseGeocoding(latitude: g.latitude, longitude: g.longitude);



    return "${address.streetAddress}, ${address.city}";
  }

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

  bool expaned = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: !expaned ? BorderRadius.circular(20) : BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 0),
          )
        ],
      ),
      padding: EdgeInsets.all(15),
      child: Column(
        children: [

          Row(
            children: [
              Image.asset('assets/org.png'),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FutureBuilder(future: _getName(docRef), initialData: "Chargement du nom...",
                      builder: (BuildContext context, AsyncSnapshot<String> text){
                        return Text(text.data==null ? "" : text.data!, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w300),);
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
                          child: Text(name, style: TextStyle(fontWeight: !expaned ? FontWeight.w500 : FontWeight.w700, fontSize: !expaned ? 20 : 25),)),
                    ],
                  ),
                ],
              ),


              /*IconButton(
                onPressed: (){
                    setState(() {
                      expaned = !expaned;
                    });
                },
                icon: Icon(expaned ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down), color: Colors.black,)

*/
            ],
          ),

          !expaned ? SizedBox.shrink() : Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined, size: 25,color:Color(0xFFE32929),),
                                ],
                              )
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //Text('Adresse', style: TextStyle(color: Color(0xFF9D9D9D)),),
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
                  SizedBox(height: 2,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Color(0xFFFFFFFF),
                                  borderRadius: BorderRadius.circular(100)
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.access_time, size: 25,color:Color(0xFFE32929),),
                                ],
                              )
                          ),
                          SizedBox(width: 10,),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //Text('Nombre de plats offerts', style: TextStyle(color: Color(0xFF9D9D9D)),),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(DateTime.fromMillisecondsSinceEpoch(timestamp.millisecondsSinceEpoch).toString()),

                                ],
                              ),
                            ],
                          ),

                        ],
                      ),

                      Container(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                            onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>EventDetails(name: name, location: location, docRef: docRef, interested: interested, timestamp: timestamp, places: places,)));},

                            child: Container(


                              padding: EdgeInsets.fromLTRB(15,5,10,5),

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xFF757575),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text("Détails", style: TextStyle(fontSize: 12, color: Colors.white),),
                                  Icon(Icons.keyboard_arrow_right, color: Colors.white,)
                                ],
                              ),
                            )),
                      ),

                    ],
                  ),


                ],
              )
            ],
          ),





        ],
      ),
    );
  }
}



