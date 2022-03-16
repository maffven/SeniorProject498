import 'dart:io';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter_application_1/model/BinLevel.dart';
import 'package:flutter_application_1/model/tabs_page.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';

const double GMAP_DEFAULT_LATITUDE = 21.584873;
const double GMAP_DEFAULT_LONGITUDE = 39.205959;
const double GMAP_DEFAULT_ZOOM = 12;
 var distance=0;
  BinLevel level = BinLevel();
const CameraPosition INITIAL_CAMERA_POSITION = CameraPosition(
  target: LatLng(
    GMAP_DEFAULT_LATITUDE,
    GMAP_DEFAULT_LONGITUDE,
  ),
  zoom: GMAP_DEFAULT_ZOOM,
);
void main() async {
 WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp()
      .then((value) => print("connected " + value.options.asMap.toString()))
      .catchError((e) => print(e.toString()));
       runApp(map()); //function written by flutter
}

  //Create a database reference
  final databaseReference = FirebaseDatabase.instance.reference();
  //to read the distance from the firebase
   void readDistance(){
    //this means the data is up to date
      databaseReference.onValue.listen((event){
      final distanceFirebase = new Map<String, dynamic>.from(event.snapshot.value);
      print(distanceFirebase['Distance']);
       distance = distanceFirebase['Distance'];
     });
     
  }

//list of markers on the map
List<Marker> markers = [
  Marker(
    infoWindow: InfoWindow(
    title: "Empty Bin"),
    markerId: MarkerId('Green'),
    position: LatLng(21.584873, 39.205959),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    onTap: () {
   MapUtils.openMap(21.584873, 39.205959);//to open google map app/direct 
  }

  ),
Marker(
  infoWindow: InfoWindow(
    title: "Full Bin"),
    markerId: MarkerId('Red'),
    position: LatLng(21.543333, 39.172779),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
    onTap: () {
   MapUtils.openMap(21.543333, 39.172779); //to open google map app/direct 
  }
  ),
  Marker(
    infoWindow: InfoWindow(
    title: "Half-Full Bin"),
    markerId: MarkerId('Orange'),
    position: LatLng(21.285407, 39.237551),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
    onTap: () {
  MapUtils.openMap(21.285407, 39.237551);//to open google map app/direct 
  }
  ),

];
   final Marker marker = Marker( 
     markerId: MarkerId('Green'),
    position: LatLng(21.584873, 39.205959),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
    onTap: () {
   MapUtils.openMap(21.584873, 39.205959);//to open google map app/direct 
  });
class map extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeDemo(),
    );
  }
}
class HomeDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}
class _LoginDemoState extends State<HomeDemo> {
    @override
  void initState(){
    super.initState();
    readDistance();
  }

  @override
  Widget build(BuildContext context) { 
return Scaffold(
  appBar: AppBar(
        backgroundColor: Color(0xffffDD83),
        title: Text("Map"),
      ),
      
      body: 
      GoogleMap(
        initialCameraPosition: INITIAL_CAMERA_POSITION,
     //   markers: Set<Marker>.of(markers),
          markers: Set<Marker>.of(markers),
      ),
    );
}

}
class MapUtils {

  MapUtils._();
//these method and class are created to open the google map application
//once the user clicks on any pin/marker
  static Future<void> openMap(double latitude, double longitude) async {
    String googleUrl = 'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await canLaunch(googleUrl)) {
      await launch(googleUrl);
    } else {
      throw 'Could not open the map.';
    }
  }


  
}