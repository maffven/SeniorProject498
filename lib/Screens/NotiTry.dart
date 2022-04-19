import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/AdminDashboard.dart';
import 'package:flutter_application_1/Screens/DistrictListTab.dart';
import 'package:flutter_application_1/Screens/EditComplaints.dart';
import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter_application_1/model/BinLevel.dart';
import 'package:flutter_application_1/model/District.dart';
import 'package:flutter_application_1/model/Complaints.dart';
import 'package:flutter_application_1/model/Driver.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(home: ViewNotification()));

class ViewNotification extends StatefulWidget {
  @override
  _ViewNotification createState() => _ViewNotification();
}

class _ViewNotification extends State<ViewNotification>
    with AutomaticKeepAliveClientMixin<ViewNotification> {
  @override
  bool get wantKeepAlive => true;
  //Define variables
  List<Complaints> complaints;
  List<BinLevel> binLevels = [];
  List<District> district;
  List<Widget> boxWidgets = [];
  Color color;
  String level;
  var status;
  String distName;
  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<Widget>>(
          future: getWidgets(),
          builder: (context, snapshot) {
            final comps = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else {
                  return buildNotifications(comps);
                }
            }
          },
        ),
      );
  Future deleteObj(int id, String tableName) async {
    print("$id rawan");
    await DatabaseHelper.instance.gneralDelete(id, tableName);
    print("Object is deleted");
  }

  Widget buildNotifications(List<Widget> complaints) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              backgroundColor: Color(0xffffDD83),
              title: Text("View Notifications"),
            ),
            body: SingleChildScrollView(
              child: Padding(
                // to add search button you have to add padding
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child:
                      Wrap(spacing: 20, runSpacing: 20.0, children: complaints),
                ),
              ),
            )));
  }

  //get all complaints from database
  Future<List<BinLevel>> getBinLevels() async {
    //Get complaints from DB
    List<BinLevel> binLevel = [];
    List<dynamic> compDB = await readAll(tableBinLevel);
    binLevel = compDB.cast();
    for (int i = 0; i < binLevel.length; i++) {
      if (binLevel[i].empty == true) {
        level = "Empty";
      } else if (binLevel[i].half_full == true) {
        color = Color(0xfff19840);
        level = "Half-Full";
      } else {
        color = Color(0xfff05e5e);
        level = "Full";
      }
      //-------------------------------------------
      if (binLevel[i].binID == 144) {
        distName = "Aljamea";
      } else if (binLevel[i].binID == 1) {
        distName = "Alnaseem";
      } else if (binLevel[i].binID == 2) {
        distName = "Alfaisaliyah";
      } else if (binLevel[i].binID == 3) {
        distName = "Alwaha";
      } else {
        distName = "Alsulaimaniyah";
      }

      //----------------------------------------------
      print("complaints length ${compDB.length}");
      return binLevel;
    }
  }

  //get box widgets
  Future<List<Widget>> getWidgets() async {
    binLevels = await getBinLevels();
    for (int i = 0; i < binLevels.length; i++) {
      if (level == "Full") {
        //don't show the empty and half-full ones
        boxWidgets.add(SizedBox(
            width: 370.0,
            height: 100.0,
            child: InkWell(
              //move to the specific complaint's detail screen
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(builder: (BuildContext context) {
                return EditComplaints(complaint: complaints[i]);
              })),
              child: Card(
                borderOnForeground: true,
                color: Colors.white,
                elevation: 2.0,
                shape: RoundedRectangleBorder(
                    side: BorderSide(color: Color(0xff28CC9E), width: 1),
                    borderRadius: BorderRadius.circular(8.0)),
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        height: 5.0,
                      ),
                      Text(
                        "\t" + distName,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      Text("\t \t"),
                      Icon(
                        Icons.circle_sharp,
                        color: color,
                      ),
                      Text(
                        "\t" + level + " in bin " + '${binLevels[i].binID}',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 2.0,
                      ),
                    ],
                  ),
                )),
              ),
            )));
      }
    }
    return boxWidgets;
  }

  //read objects
  //int id, String tableName, dynamic classFields, dynamic className
  Future<dynamic> readObj(int id, String tableName) async {
    return await DatabaseHelper.instance.generalRead(tableName, id);
  }

  Future<List<dynamic>> readAll(String tableName) async {
    //We have to define list here as dynamci *******
    return await DatabaseHelper.instance.generalReadAll(tableName);
  }
}