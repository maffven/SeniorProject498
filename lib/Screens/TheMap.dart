
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main(){
runApp(MyApp());//function written by flutter 
}

class MyApp extends StatelessWidget {
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
  Completer<GoogleMapController> _controller = Completer();
  final Set<Marker> listMarkers = {};
  MapType currentMapType = MapType.normal;
  BitmapDescriptor customIcon;
  
static const LatLng _center = const LatLng(21.584873, 39.205959);

//Markers

void _onMapCreated(GoogleMapController controller) {
_controller.complete(controller);
}
static final LatLng _kMapCenter =
    LatLng(21.584873, 39.205959);

static final CameraPosition _kInitialPosition =
    CameraPosition(target: _kMapCenter, zoom: 11.0, tilt: 0, bearing: 0);
    
  @override
  Widget build(BuildContext context) {
 listMarkers.add(Marker(
      markerId: MarkerId("1"),
      position: LatLng(41.40442592799307, 2.1761136771317475),
      infoWindow: InfoWindow(title: "La Sagrada Familia"),
      icon: customIcon
    ));
 
    listMarkers.add(Marker(
        markerId: MarkerId("2"),
        position: LatLng(41.39641729508688, 2.161925892612031),
        infoWindow: InfoWindow(title: "Casa Mila"),
        icon: customIcon));
 
    listMarkers.add(Marker(
        markerId: MarkerId("3"),
        position: LatLng(41.38840767527953, 2.173175802559483),
        infoWindow: InfoWindow(title: "Placa de Catalunya"),
        icon: customIcon));
 
    listMarkers.add(Marker(
        markerId: MarkerId("4"),
        position: LatLng(41.41503960716928, 2.1570586431097203),
        infoWindow: InfoWindow(title: "Park Guell"),
        icon: customIcon));


    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Color(0xffffDD83) ,
        title: Text("Map"),
      ),
      body:  Stack(
          children: [
            GoogleMap(
              mapType: currentMapType,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: _kInitialPosition,
              compassEnabled: true,
              markers: listMarkers,
            ),
            Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                child: Icon(Icons.map, size: 30),
                onPressed: _onMapTypeChanged,
              ),
            )
          ],
        ));
  }
  void _onMapTypeChanged() {
    setState(() {
      currentMapType = currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }
 
  void setCustomMarker() async {
    customIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5), '/Users/mac/Desktop/flutter_application_1/assets/images/GreenMarker');
  }
 
  
}


