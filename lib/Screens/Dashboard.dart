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
              CupertinoTabScaffold(
                tabBar: CupertinoTabBar(
                    onTap: (index) {
                      switch (index) {
                        case 0:
                          print('Clicked Tab $index');
                          break;
                        case 1:
                          print('Clicked Tab $index');
                          break;
                        case 2:
                          print('Clicked Tab $index');
                          break;
                        case 3:
                          print('Clicked Tab $index');
                          break;
                        case 4:
                          print('Clicked Tab $index');
                          break;
                      }
                    },
                    items: [
                      BottomNavigationBarItem(
                        label: 'Dashboards',
                        icon: Icon(CupertinoIcons.chart_pie),
                      ),
                      BottomNavigationBarItem(
                        label: 'Map',
                        icon: Icon(CupertinoIcons.map),
                      ),
                      BottomNavigationBarItem(
                        label: 'Notifications',
                        icon: Icon(CupertinoIcons.bell),
                      ),
                      BottomNavigationBarItem(
                        label: 'Complaints',
                        icon: Icon(CupertinoIcons.mail),
                      ),
                      BottomNavigationBarItem(
                        label: 'Profile',
                        icon: Icon(CupertinoIcons.person_circle),
                      ),
                    ]),
                tabBuilder: (context, index) {
                  return Container();
                },
              ),
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

