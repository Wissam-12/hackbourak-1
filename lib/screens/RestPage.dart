
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocode/geocode.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hackbourak/Shared/SharedFunctions.dart';
import 'package:hackbourak/screens/EventList.dart';
import 'package:hackbourak/screens/Loading.dart';
import 'package:hackbourak/screens/RestaurantSmallDetails.dart';
import 'package:hackbourak/screens/RestuarantCard.dart';
import 'package:hackbourak/screens/WelcomeScreen.dart';
import 'package:location/location.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:flutter/services.dart' show rootBundle;
import 'package:sliding_up_panel/sliding_up_panel.dart';

class RestPage extends StatefulWidget {
  const RestPage({Key? key}) : super(key: key);

  @override
  State<RestPage> createState() => _RestPageState();
}

class _RestPageState extends State<RestPage> with WidgetsBindingObserver  {

  late GoogleMapController _controller;

  PanelController _pc = new PanelController();


  String _mapStyle = "";

  bool panelOpen = false;

  bool Located = true;

  bool rebuild = true;

  Location _location = Location();

  late LocationData currentLoc;

  Set<Marker> markers = Set();

  GeoPoint markerPoint = GeoPoint(36, 3);
  int markerPlaces=0;
  int markerInterested = 0;
  String markerName = "";
   bool markerClicked = false;

  Future<String> _getAddress(GeoPoint g) async {
    if (g.latitude == null || g.longitude == null) return "";
    GeoCode geoCode = GeoCode();
    Address address = await geoCode.reverseGeocoding(latitude: g.latitude, longitude: g.longitude);



    return "${address.streetAddress}, ${address.city}";
  }


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
    _controller.setMapStyle(_mapStyle);
    _location.onLocationChanged.listen((l) {

      currentLoc = l;

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

  @override
  void initState() {

    WidgetsBinding.instance!.addObserver(this);
    rootBundle.loadString('assets/mapStyle.txt').then((string) {
      _mapStyle = string;
    });
    super.initState();
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state)  {
    if (state == AppLifecycleState.resumed || state == AppLifecycleState.paused) {

      _controller.setMapStyle(_mapStyle);
    }
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
          return Scaffold(

              backgroundColor: const Color(0xFFE32929),
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/loading_bg.png'),
                  ),
                ),
                child: Center(
                    child : CircularProgressIndicator(color: Colors.white,),

                ),
              ),
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
                    showMaterialModalBottomSheet(

                      shape: RoundedRectangleBorder(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30.0),
                          topRight: Radius.circular(30.0),
                        ),
                      ),
                      context: context,
                      builder: (context) =>
                          ClipRRect(
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(24.0),
                                topRight: Radius.circular(24.0),
                              ),
                              child: SizedBox(height : MediaQuery.of(context).size.height/100*40,child: RestaurantSmallDetails(timestamp: data['date'],docRef: data['owner'],name: data['name'], location: data['location'], places: data['places'], interested: data['interested']))),
                    );
                  }
              )
          );
          print(data);
        });

        return Scaffold(

            body: SlidingUpPanel(
                controller: _pc,
                minHeight: MediaQuery.of(context).size.height*12/100,
                maxHeight: MediaQuery.of(context).size.height*90/100,

                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),

              collapsed: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(24.0),
                  topRight: Radius.circular(24.0),
                ),
                child: Container(
                  color: Colors.white,
                  child: GestureDetector(
                    onTap: (){
                      if (_pc.isPanelOpen){
                        _pc.close();
                      }else{
                        _pc.open();
                      }

                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/swipe_indicator.png'),
                        SizedBox(height: 15,),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              //Icon(Icons.location_on_outlined, size: 35,color: Color(0xFFE32929)),
                              Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  child: Text('A proximité de votre localisation', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),)
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),

                panel:
                  ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(24.0),
                      topRight: Radius.circular(24.0),
                    ),
                    child: EventList(
                        clickHandler: (){
                          if (_pc.isPanelOpen){
                            _pc.close();
                          }else{
                            _pc.open();
                          }
                        },
                    ),
                  ),
                body: rebuild ? Scaffold(
                  floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
                  floatingActionButton: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[

                        FloatingActionButton(
                          onPressed: () async {
                            SharedFunctions.showLoaderDialog(context);
                            await FirebaseAuth.instance.signOut();
                            Navigator.pop(context);
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WelcomeScreen()));

                            },
                          backgroundColor: Colors.white,
                          child: Icon(Icons.logout, color: Color(0xFF424866),),
                        ),
                        SizedBox(height: 10,),
                        FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: () {},
                          child: Icon(Icons.add, color: Color(0xFF424866),),
                        ),
                        SizedBox(height: 10,),
                        FloatingActionButton(
                          onPressed: () {},
                          backgroundColor: Colors.white,
                          child: Icon(Icons.assistant_outlined, color: Color(0xFF424866),),
                        ),
                        SizedBox(height: 10,),
                        FloatingActionButton(
                          onPressed: () async {

                            if (currentLoc != null){
                              var l = currentLoc;
                              _controller.animateCamera(
                                  CameraUpdate.newCameraPosition(
                                    CameraPosition(
                                        target: LatLng(l.latitude!, l.longitude!), zoom: 15),
                                  )
                              );
                            }


                          },
                          backgroundColor: Colors.white,
                          child: Icon(Icons.my_location, color: Color(0xFF424866)),
                        )
                      ],
                    ),
                  ),
                  body: GoogleMap(

                          mapType: MapType.normal,
                          initialCameraPosition: _kGooglePlex,
                          onMapCreated: _onMapCreated,
                          myLocationButtonEnabled: false,
                          myLocationEnabled: true,
                          markers: markers,
                        ),
                ) : CircularProgressIndicator(),
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
