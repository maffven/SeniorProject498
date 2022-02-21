import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/second.dart';
import 'package:flutter_application_1/screens/first.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Color(0xffffDD83),
        title: Text("Hello"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            GestureDetector(
    onTap: () { 
       Navigator.push(
    context,
    MaterialPageRoute(builder: (context) =>  second()),
  );
    },
            child: Container(
  
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
            )
          ],
        ),
      ),
    );
  }

  void _incrementCounter() {}
  void _decrementCounter() {}
}
