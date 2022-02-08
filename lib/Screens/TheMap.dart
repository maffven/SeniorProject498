import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(MyApp()); //function written by flutter
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

  final Set<Marker> listMarkers = {};
  Set<Marker> markers;
  MapType currentMapType = MapType.normal;
  BitmapDescriptor customIcon;

  BitmapDescriptor pinLocationIcon;
  Set<Marker> _markers = {};
  Completer<GoogleMapController> _controller = Completer();
    @override
  void initState() {
      super.initState();
      setCustomMapPin();
  }

  void setCustomMapPin() async {
    pinLocationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 2.5),
        '/Users/mac/Desktop/flutter_application_1/assets/images/GreenMarker.png');
  }

  /*@override 
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
  }*/

//static const LatLng _center = const LatLng(21.584873, 39.205959);

//Markers

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  static final LatLng _kMapCenter = LatLng(36.98, -121.99);

  static final CameraPosition _kInitialPosition =
      CameraPosition(target: _kMapCenter, zoom: 18.0, tilt: 0, bearing: 0);

  @override
  Widget build(BuildContext context) {
    //8 FEB
    LatLng pinPosition = LatLng(37.3797536, -122.1017334);

// these are the minimum required values to set
    // the camera position
    CameraPosition initialLocation =
    CameraPosition(zoom: 16, bearing: 30, target: pinPosition);

    //createMarker(context);
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
    /*return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xffffDD83),
          title: Text("Map"),
        ),
        body: Stack(
          children: [
            GoogleMap(
              myLocationEnabled: true,
              markers: _markers,
              initialCameraPosition: initialLocation,

              
             /* onTap: (pos) {
                print(pos);
                Marker m = Marker(
                    markerId: MarkerId("1"), icon: customIcon, position: pos);
                markers.add(m);
              },
              mapType: currentMapType,*/


              onMapCreated: (GoogleMapController controller) {
                _controller.complete(controller);
      setState(() {
         _markers.add(
            Marker(
               markerId: MarkerId(‘<MARKER_ID>’),
               position: pinPosition,
               icon: pinLocationIcon
            )
         );
      });



              },
            //  initialCameraPosition: _kInitialPosition,
             // compassEnabled: true,
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
        ));*/

return GoogleMap(
      myLocationEnabled: true,
      compassEnabled: true,
      markers: _markers,
      initialCameraPosition: initialLocation,
      onMapCreated: (GoogleMapController controller) {
          controller.setMapStyle(Utils.mapStyles);
          _controller.complete(controller);
          setState(() {
            _markers.add(
                Marker(
                  markerId: MarkerId('<MARKER_ID>'),
                  position: pinPosition,
                  icon: pinLocationIcon
                )
            );
          });
      });
  
  }

  void _onMapTypeChanged() {
    setState(() {
      currentMapType =
          currentMapType == MapType.normal ? MapType.satellite : MapType.normal;
    });
  }

 

}

class Utils {
  static String mapStyles = '''[
  {
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "elementType": "labels.icon",
    "stylers": [
      {
        "visibility": "off"
      }
    ]
  },
  {
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "elementType": "labels.text.stroke",
    "stylers": [
      {
        "color": "#f5f5f5"
      }
    ]
  },
  {
    "featureType": "administrative.land_parcel",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#bdbdbd"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "poi",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "poi.park",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "road",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#ffffff"
      }
    ]
  },
  {
    "featureType": "road.arterial",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#757575"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#dadada"
      }
    ]
  },
  {
    "featureType": "road.highway",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#616161"
      }
    ]
  },
  {
    "featureType": "road.local",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  },
  {
    "featureType": "transit.line",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#e5e5e5"
      }
    ]
  },
  {
    "featureType": "transit.station",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#eeeeee"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "geometry",
    "stylers": [
      {
        "color": "#c9c9c9"
      }
    ]
  },
  {
    "featureType": "water",
    "elementType": "labels.text.fill",
    "stylers": [
      {
        "color": "#9e9e9e"
      }
    ]
  }
]''';
}
