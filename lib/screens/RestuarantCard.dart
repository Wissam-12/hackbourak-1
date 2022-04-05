
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:geocoding/geocoding.dart';

class RestaurantCard extends StatefulWidget {
  RestaurantCard({Key? key, required this.name, required this.location, required this.places, required this.interested}) : super(key: key);

  String name;
  GeoPoint location ;
  int places;
  int interested;
  @override
  State<RestaurantCard> createState() => _RestaurantCardState(name : name, location: location, places: places, interested: interested);
}

class _RestaurantCardState extends State<RestaurantCard> {

  _RestaurantCardState({required this.name, required this.location, required this.places, required this.interested});

  int places;
  int interested;

  String name= "";
  GeoPoint location ;

  Future<String> _getAddress(GeoPoint g) async {
    if (g.latitude == null || g.longitude == null) return "";
    GeoCode geoCode = GeoCode();
    Address address = await geoCode.reverseGeocoding(latitude: g.latitude, longitude: g.longitude);



    return "${address.streetAddress}, ${address.city}";
  }

  bool expaned = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: !expaned ? BorderRadius.circular(30) : BorderRadius.circular(58),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 0),
          )
        ],
      ),
      padding: EdgeInsets.all(25),
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


              IconButton(
                onPressed: (){
                    setState(() {
                      expaned = !expaned;
                    });
                },
                icon: Icon(expaned ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down), color: Colors.black,)


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
                              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
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
                              margin: EdgeInsets.fromLTRB(20, 0, 20, 0),
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

          !expaned ? SizedBox.shrink() : Column(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Container(
                    margin: EdgeInsets.fromLTRB(40, 20, 40, 0),
                    child: TextButton(
                        onPressed: (){},

                        child: Container(

                          padding: EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color: Color(0xFFE32929),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Plus de détails", style: TextStyle(color: Colors.white),),
                              Icon(Icons.keyboard_arrow_right, color: Colors.white,)
                            ],
                          ),
                        )),
                  )

                ],
              )
            ],
          ),



        ],
      ),
    );
  }
}



