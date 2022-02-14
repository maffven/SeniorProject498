import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(home: Dashboard()));

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffffDD83),
              title: Text("Driver List"),
            ),
            body: SafeArea(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                // to add search button you have to add padding
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: Wrap(
                      spacing: 20,
                      runSpacing: 20.0,
                      children: <Widget>[
                        SizedBox(
                          width: 160.0,
                          height: 160.0,
                          child: Card(
                            borderOnForeground: true,
                            color: Colors.white,
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    color: Color(0xff28CC9E), width: 1),
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Driver name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "2 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 160.0,
                          height: 160.0,
                          child: Card(
                            color: Color.fromARGB(255, 21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Driver name",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "12 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 160.0,
                          height: 160.0,
                          child: Card(
                            color: Color.fromARGB(255, 21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Driver name",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "4 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            )),
                          ),
                        ),
                        SizedBox(
                          width: 160.0,
                          height: 160.0,
                          child: Card(
                            color: Color.fromARGB(255, 21, 21, 21),
                            elevation: 2.0,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0)),
                            child: Center(
                                child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: <Widget>[
                                  SizedBox(
                                    height: 10.0,
                                  ),
                                  Text(
                                    "Settings",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0),
                                  ),
                                  SizedBox(
                                    height: 5.0,
                                  ),
                                  Text(
                                    "6 Items",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w100),
                                  )
                                ],
                              ),
                            )),
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ))));
  }
}
