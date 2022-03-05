import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/DistrictListTab.dart';
import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter_application_1/model/District.dart';
import 'package:flutter_application_1/model/Driver.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MaterialApp(home: DriverList()));

class DriverList extends StatefulWidget {
  @override
  _DriverList createState() => _DriverList();
}

class _DriverList extends State<DriverList>
    with AutomaticKeepAliveClientMixin<DriverList> {
  @override
  bool get wantKeepAlive => true;
  //Define variables
  List<Driver> drivers;
  List<District> district;
  List<Widget> boxWidgets = [];

  @override
  Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<Widget>>(
          future: getWidgets("Driver"),
          builder: (context, snapshot) {
            final drivers = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else {
                  return buildDrivers(drivers);
                }
            }
          },
        ),
      );

  Widget buildDrivers(List<Widget> drivers) {
    return MaterialApp(
        home: Scaffold(
            resizeToAvoidBottomInset: false,
            body: SingleChildScrollView(
              child: Padding(
                // to add search button you have to add padding
                padding: const EdgeInsets.all(12.0),
                child: Center(
                  child: Wrap(spacing: 20, runSpacing: 20.0, children: drivers),
                ),
              ),
            )));
  }

//Class methods

  //get all drivers from database
  Future<List<Driver>> getDrivers() async {
    //Get drivers from DB
    List<Driver> driv;
    List<dynamic> driversDB = await readAll(tableDriver);
    driv = driversDB.cast();
    print("in get drivers method");
    print("drivers length ${driversDB.length}");
    return driv;
  }

  //get box widgets
  Future<List<Widget>> getWidgets(String tab) async {
    drivers = await getDrivers();
    for (int i = 0; i < drivers.length; i++) {
      boxWidgets.add(SizedBox(
          width: 160.0,
          height: 160.0,
          child: InkWell(
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
                  child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 10.0,
                      ),
                      Text(
                        '${drivers[i].firstName} ${drivers[i].lastName}',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                      SizedBox(
                        height: 5.0,
                      ),
                      /*  Text(
                  "2 Items",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w100),
                )*/
                    ],
                  ),
                )),
              ),
              onTap: () {})));
    }
    return boxWidgets;
  }

  //read objects
  //int id, String tableName, dynamic classFields, dynamic className
  Future<dynamic> readObj(int id, String tableName) async {
    return await DatabaseHelper.instance.generalRead(tableName, id);
    //print("mun object: ${munObj.firatName}");
  }

  Future<List<dynamic>> readAll(String tableName) async {
    //We have to define list here as dynamci *******
    return await DatabaseHelper.instance.generalReadAll(tableName);
    // print("mun object: ${munList[0].firatName}");
  }
}
