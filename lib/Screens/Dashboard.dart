import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/map.dart';
import 'package:flutter_application_1/screens/first.dart';

void main() => runApp(Dashboard());

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DashboardDemo(),
    );
  }
}

class DashboardDemo extends StatefulWidget {
  @override
  _Dashboard createState() => _Dashboard();
}

class _Dashboard extends State<DashboardDemo> {
// Bottom menu bar
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xffffDD83),
          title: Text("Dashboard"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  margin: const EdgeInsets.only(top: 240.0, right: 10),
                  child: Center(
                      child: Container(
                    width: 207,
                    height: 170,
                    // child: Image.asset('/Users/mac/Desktop/flutter_application_1/assets/images/first.png')),
                  ))),
             
            ],
          ),
        ),
      );
}
/*Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xffffDD83),
          title: Text("Hello"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                margin: const EdgeInsets.only(top: 240.0, right: 10),
                child: Center(
                  child: Container(
                    decoration: new BoxDecoration(
                      image: new DecorationImage(
                        image: AssetImage(
                            "/Users/mac/Desktop/flutter_application_1/assets/images/ourLogo.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                    width: 207,
                    height: 170,
                    // child: Image.asset('/Users/mac/Desktop/flutter_application_1/assets/images/first.png')),
                  ),
                ),
              ),
            ],
          ),
        ),
      ); */

