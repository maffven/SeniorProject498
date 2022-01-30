
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/first.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main(){
runApp(MyApp());//function written by flutter 
}

/*class MyApp extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
   return MaterialApp( title: 'Welcome to Flutter',
   home: Text('Manar Hennawi'),);
   //create this App
  }

}*/

class HomeDemo extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<HomeDemo> {
Completer<GoogleMapController> _controller = Completer();
static const LatLng _center = const LatLng(45.521563, -122.677433);
void _onMapCreated(GoogleMapController controller) {
_controller.complete(controller);
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Color(0xffffDD83) ,
        title: Text("Map"),
      ),
      body:  GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: _center,
            zoom: 11.0,
          ),
        ),
    );
  }
         
  void _incrementCounter(){

  }
  void _decrementCounter(){

  }
}
