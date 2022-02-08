
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
  Set<Marker> markers;
  MapType currentMapType = MapType.normal;
  BitmapDescriptor customIcon;
  @override 
  void initState(){
    super.initState();
    markers = Set.from([]);
  }
  createMarker(context){
    if(customIcon == null){
    ImageConfiguration configuration = createLocalImageConfiguration(context);
    BitmapDescriptor.fromAssetImage(configuration, '/Users/mac/Desktop/flutter_application_1/assets/images/GreenMarker.png')
    .then((icon){
      setState(() {
     customIcon = icon;
      });
    });


    }
  }



//static const LatLng _center = const LatLng(21.584873, 39.205959);

//Markers

void _onMapCreated(GoogleMapController controller) {
_controller.complete(controller);
}
static final LatLng _kMapCenter =
    LatLng(36.98, -121.99);

static final CameraPosition _kInitialPosition =
    CameraPosition(target: _kMapCenter, zoom: 18.0, tilt: 0, bearing: 0);
    
  @override
  Widget build(BuildContext context) {
    createMarker(context);
/* markers.add(Marker(
      markerId: MarkerId("1"),
      position: LatLng(41.40442592799307, 2.1761136771317475),
      infoWindow: InfoWindow(title: "La Sagrada Familia"),
      icon: customIcon
    ));
 
    markers.add(Marker(
        markerId: MarkerId("2"),
        position: LatLng(41.39641729508688, 2.161925892612031),
        infoWindow: InfoWindow(title: "Casa Mila"),
       icon: customIcon
        ));
 
    markers.add(Marker(
        markerId: MarkerId("3"),
        position: LatLng(41.38840767527953, 2.173175802559483),
        infoWindow: InfoWindow(title: "Placa de Catalunya"),
       icon: customIcon
        ));
 
    markers.add(Marker(
        markerId: MarkerId("4"),
        position: LatLng(41.41503960716928, 2.1570586431097203),
        infoWindow: InfoWindow(title: "Park Guell"),
        icon: customIcon
        ));*/
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
         backgroundColor: Color(0xffffDD83) ,
        title: Text("Map"),
      ),
      body:  Stack(
          children: [
            GoogleMap(
              markers: markers,
              onTap: (pos){
                print(pos);
                Marker m = Marker(markerId: MarkerId("1"), icon: customIcon, position: pos);
                markers.add(m);
              },
              mapType: currentMapType,
              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
              },
              initialCameraPosition: _kInitialPosition,
              compassEnabled: true,
     
            ),
           /* Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                child: Icon(Icons.map, size: 30),
                onPressed: _onMapTypeChanged,
              ),
            )*/
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
        ImageConfiguration(devicePixelRatio: 2.5), '/Users/mac/Desktop/flutter_application_1/assets/images/GreenMarker.png');
  }
 
  
}


