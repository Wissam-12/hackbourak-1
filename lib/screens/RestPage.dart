
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackbourak/screens/RestuarantCard.dart';
import 'package:location/location.dart';

class RestPage extends StatefulWidget {
  const RestPage({Key? key}) : super(key: key);

  @override
  State<RestPage> createState() => _RestPageState();
}

class _RestPageState extends State<RestPage> {

  late GoogleMapController _controller;

  bool Located = true;

  Location _location = Location();

  Set<Marker> markers = Set();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(36.753229, 3.071947),
    zoom: 14.4746,
  );

  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  void _onMapCreated(GoogleMapController _cntlr)
  {
    _controller = _cntlr;
    _location.onLocationChanged.listen((l) {
      if (Located) {
        _controller.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
                target: LatLng(l.latitude!, l.longitude!), zoom: 15),
          ),

        );
        //markers.add(Marker(markerId: MarkerId("loc"), position: LatLng(l.latitude!, l.longitude!)));
        Located = false;
      }
    });
  }

  void _goToTheLake()  {
    _controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }


  @override
  Widget build(BuildContext context) {

    Stream<QuerySnapshot> collectionStream = FirebaseFirestore.instance.collection('restos').snapshots();



    return StreamBuilder<QuerySnapshot>(
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

        //markers.clear();


        snapshot.data!.docs.forEach((DocumentSnapshot document) {
          Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
          markers.add(
              Marker(
                  markerId: MarkerId(document.id),
                  position: LatLng(data['location'].latitude,data['location'].longitude),

                  onTap: (){
                      print("le resto name is"+data['name']);
                      showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),

                              ),
                              child: RestaurantCard(name : data['name']),
                            );
                          }
                      );
                  }
              )
          );
          print(data);
        });

        return Scaffold(
          appBar: AppBar(
            title: Text('Map Page'),
          ),
          body: GoogleMap(
            mapType: MapType.normal,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: _onMapCreated,
            myLocationEnabled: true,
            markers: markers,
          ),
        );

        return ListView(
          children: snapshot.data!.docs.map((DocumentSnapshot document) {
            Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
            return Text(data['name']+" "+data['cords'], style: TextStyle(fontSize: 20,),);
          }).toList(),
        );
      },
    );
  }
}
