import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/screens/first.dart';
import 'package:flutter_application_1/screens/map.dart';
import 'package:flutter_application_1/screens/Complaint.dart';
import 'package:flutter_application_1/screens/Notification.dart';
import 'package:flutter_application_1/screens/PieChartDashboard.dart';
import 'package:flutter_application_1/screens/Login.dart';

void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Training',
      home: Main(),
    );
  }
}

class Main extends StatelessWidget {
  const Main({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoTabScaffold(
      tabBar: CupertinoTabBar(
        items: <BottomNavigationBarItem>[
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
        ],
      ),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return PieChartDashboardDemo();
            break;
          case 1:
            return map();
            break;
          case 2:
            break;
          case 3:
            return Complaint();

          default:
            return Login();
        }
      },
    );
  }
}
