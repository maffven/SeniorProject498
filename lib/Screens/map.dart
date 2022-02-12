import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
const double GMAP_DEFAULT_LATITUDE = 21.584873;
const double GMAP_DEFAULT_LONGITUDE = 39.205959;
const double GMAP_DEFAULT_ZOOM = 12;

const CameraPosition INITIAL_CAMERA_POSITION = CameraPosition(
  target: LatLng(
    GMAP_DEFAULT_LATITUDE,
    GMAP_DEFAULT_LONGITUDE,
  ),
  zoom: GMAP_DEFAULT_ZOOM,
);
void main() {
  runApp(map()); //function written by flutter
}
List<Marker> markers = [
  Marker(
    markerId: MarkerId('Green'),
    position: LatLng( 21.584873, 39.205959),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen),
  ),
Marker(
    markerId: MarkerId('Red'),
    position: LatLng(21.543333, 39.172779),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
  ),
  Marker(
    markerId: MarkerId('Orange'),
    position: LatLng( 21.285407, 39.237551),
    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueOrange),
  ),

];
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
  Widget build(BuildContext context) { 
return Scaffold(
  appBar: AppBar(
        backgroundColor: Color(0xffffDD83),
        title: Text("Map"),
      ),
      body: 
      GoogleMap(
        initialCameraPosition: INITIAL_CAMERA_POSITION,
        markers: Set<Marker>.of(markers),

      ),

    );
}
}
