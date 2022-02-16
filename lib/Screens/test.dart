import 'package:flutter/material.dart';
import 'package:flutter_application_1/screens/Menu.dart';

void main() => runApp(MaterialApp(home: test()));

//class test extends StatelessWidget {
// @override
//  Widget build(BuildContext context) {
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      theme: ThemeData(
//        primarySwatch: Colors.blue,
//      ),
// home: MyHomePage(title: 'title'),
//    );
//  }

//class MyHomePage extends StatefulWidget {
// ignore: non_constant_identifier_names
//MyHomePage({Key Key, this.title}) : super(key: Key);

//@override
//_MyTestState createState() => _MyTestState();

//}

class test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xffffDD83),
          title: Text("Notifications"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 150.0),
                child: Center(
                  child: Expanded(
                    child: Container(
                      height: 400.0,
                      child: ListView(
                        padding: const EdgeInsets.all(8),
                        children: <Widget>[
                          Container(
                            height: 50,
                            child: const Center(
                                child: Text('Alnaseem Full bin 1807422')),
                          ),
                          Container(
                            height: 50,
                            child: const Center(
                                child: Text('AlRawdhah Full bin 1808422')),
                          ),
                          Container(
                            height: 50,
                            child: const Center(
                                child: Text('Alnaeem Full bin 1819422')),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
