import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
const double GMAP_DEFAULT_LATITUDE = 21.584873;
const double GMAP_DEFAULT_LONGITUDE = 39.205959;
const double GMAP_DEFAULT_ZOOM = 18;

const CameraPosition INITIAL_CAMERA_POSITION = CameraPosition(
  target: LatLng(
    GMAP_DEFAULT_LATITUDE,
    GMAP_DEFAULT_LONGITUDE,
  ),
  zoom: GMAP_DEFAULT_ZOOM,
);
void main() {
  runApp(MyApp()); //function written by flutter
}

List<Marker> markers = [
  Marker(
    markerId: MarkerId('A'),
    
    position: LatLng( 21.584873, 39.205959),
    //icon: BitmapDescriptor.defaultMarkerWithHue(myColor),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  )
];
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeDemo(),
    );
   /* return Scaffold(
      body: GoogleMap(
        initialCameraPosition: INITIAL_CAMERA_POSITION,
        markers: Set<Marker>.of(markers),
      ),
    );*/
  }
}

class HomeDemo extends StatefulWidget {
  @override
  _LoginDemoState createState() => _LoginDemoState();
}

class _LoginDemoState extends State<HomeDemo> {

  @override
  Widget build(BuildContext context) {
return Scaffold(
      body: GoogleMap(
        initialCameraPosition: INITIAL_CAMERA_POSITION,
        markers: Set<Marker>.of(markers),
      ),
    );
  
}

}
