import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  Widget build(BuildContext context) => CupertinoTabScaffold(
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
      );
}
