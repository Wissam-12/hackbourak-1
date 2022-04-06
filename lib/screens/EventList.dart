import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackbourak/screens/RestuarantCard.dart';

class EventList extends StatefulWidget {
  EventList({Key? key , required this.clickHandler, required this.isEvents,/*required this.gctrl*/}) : super(key: key);

  bool isEvents;
  final VoidCallback clickHandler;
  //GoogleMapController gctrl;

  @override
  State<EventList> createState() => _EventListState(isEvents: isEvents ,clickHandler: clickHandler /*gctrl: gctrl*/);
}

class _EventListState extends State<EventList> {

  _EventListState({required this.clickHandler, required this.isEvents /*required this.gctrl*/});

  VoidCallback clickHandler;
  bool isEvents;
  //GoogleMapController gctrl;

  @override
  Widget build(BuildContext context) {
    Stream<QuerySnapshot> collectionStream = isEvents ? FirebaseFirestore.instance.collection('restos').snapshots() : FirebaseFirestore.instance.collection('besoins').snapshots();



    return Scaffold(

      body: StreamBuilder<QuerySnapshot>(
        stream: collectionStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(24.0),
                topRight: Radius.circular(24.0),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                !isEvents ? SizedBox(height: 30,) : SizedBox.shrink(),
                !isEvents ? Row(
                  children: [
                    SizedBox(width: 25,),
                    GestureDetector(
                      onTap: clickHandler,
                        child: Icon(Icons.close, color: Colors.black,)
                    )
                  ],
                ) : SizedBox.shrink(),
                GestureDetector(
                  onTap: clickHandler,
                  child: Container(
                    padding: EdgeInsets.all(10),

                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset('assets/swipe_indicator.png'),
                          SizedBox(height: 15,),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                //Icon(Icons.location_on_outlined, size: 35,color: Color(0xFFE32929)),
                                Container(
                                    margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                    child: Text(isEvents ? 'A proximité de votre localisation' : 'Besoins', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView(

                    children: snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data = document.data()! as Map<String, dynamic>;


                      return
                        isEvents
                            ? RestaurantCard( eventRef : "" ,docRef: data['owner'] ,timestamp: data['date'],name: data['name'], location: data['location'],places: data['places'], interested: data['interested'],)
                          : RestaurantCard( eventRef : data['event'] ,docRef: data['owner'] ,timestamp: data['date'],name: data['name'], location: GeoPoint(0,0),places: 0, interested: 0,);
                    }).toList(),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );

  }
}
