import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/AdminDashboard.dart';
import 'package:flutter_application_1/Screens/AdminDistrictDashboard.dart';
import 'package:flutter_application_1/Screens/DistrictListTab.dart';
import 'package:flutter_application_1/Screens/DriverDashboard.dart';
import 'package:flutter_application_1/Screens/DriverListTab.dart';
import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter_application_1/model/Bin.dart';
import 'package:flutter_application_1/model/BinLevel.dart';
import 'package:flutter_application_1/model/District.dart';
import 'package:flutter_application_1/model/Driver.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() => runApp(MaterialApp(home: AdminDriverDashboard()));

class AdminDriverDashboard extends StatefulWidget {
  final Driver driver;
  @override
  AdminDriverDashboard({Key key, this.driver}) : super(key: key);
  _AdminDriverDashboard createState() => _AdminDriverDashboard(driver: driver);
}

class _AdminDriverDashboard extends State<AdminDriverDashboard> {
//Define variables
  final Driver driver;
  List<Bin> bins;
  List<BinLevel> binsLevel = [];
  List<District> Assigneddistricts = [];
  List<charts.Series<PieChartData, String>> _seriesPieDataForDriver;
  _AdminDriverDashboard({this.driver});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLists().whenComplete(() {
      setState(() {});
    });
    _seriesPieDataForDriver = List<charts.Series<PieChartData, String>>();
  }

  @override
  Widget build(BuildContext context) {
    _generateDataForDriver();
    return DefaultTabController(
        length: 1,
        child: Scaffold(
            appBar: AppBar(
              backgroundColor: Color(0xffffDD83),
              title: Text("Dashboard"),
              bottom: TabBar(
                indicatorColor: Colors.white,
                tabs: [
                  Tab(text: "Driver"),
                  Tab(
                    text: "District",
                  ),
                ],
              ),
            ),
            body: TabBarView(children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 8.0, bottom: 40.0, right: 8.0, left: 8.0),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Text('${driver.firstName} ${driver.lastName}',
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'Arial',
                                  fontSize: 25)),
                          margin: EdgeInsets.only(top: 70.0),
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: charts.PieChart(_seriesPieDataForDriver,
                              animate: true,
                              animationDuration: Duration(seconds: 1),
                              behaviors: [
                                new charts.DatumLegend(
                                  outsideJustification:
                                      charts.OutsideJustification.endDrawArea,
                                  horizontalFirst: false,
                                  desiredMaxRows: 1,
                                  cellPadding: new EdgeInsets.only(
                                      top: 30.0, right: 35.0, bottom: 0.0),
                                  entryTextStyle: charts.TextStyleSpec(
                                      color:
                                          charts.MaterialPalette.black.darker,
                                      fontFamily: 'Arial',
                                      fontSize: 15),
                                )
                              ],
                              defaultRenderer: new charts.ArcRendererConfig(
                                  arcWidth: 90,
                                  arcRendererDecorators: [
                                    new charts.ArcLabelDecorator(
                                        labelPosition:
                                            charts.ArcLabelPosition.inside)
                                  ])),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ])));
  }

//Class methods

  _generateDataForDriver() {
    //data about specific district
    // await getDistricts();
    // await getBinLevel();
    // await getBins();

    //get bins level based on a specific district
    // for (int i = 0; i < bins.length; i++) {
    //   if (bins[i].districtId == district.districtID) {
    //     for (int j = 0; j < binsLevel.length; j++) {
    //       if (bins[i].binID == binsLevel[j].binID) {
    //         binsLevelForDistrict.add(binsLevel[j]);
    //       }
    //     }
    //   }
    // }

    // print("inside generate ${binsLevelForDistrict.length}");
    // double numberOfFull, numberOfHalfFull, numberOfEmpty;
    // for (int i = 0; i < binsLevelForDistrict.length; i++) {
    //   if (binsLevelForDistrict[i].full == true)
    //     numberOfFull++;
    //   else if (binsLevelForDistrict[i].half_full == true)
    //     numberOfHalfFull++;
    //   else
    //     numberOfEmpty++;
    // }

    //print("inside generate ${binsLevelForDistrict.length}");

//All bins inside assigned districts for driver
    List<Bin> binsInsideDistricts = [];
    for (int j = 0; j < bins.length; j++) {
      for (int k = 0; k < Assigneddistricts.length; k++) {
        if (bins[j].districtId == Assigneddistricts[k].districtID) {
          print("inside fill binsInsideDistricts $k");
          binsInsideDistricts.add(bins[j]);
        }
      }
    }
    print("binsInsideDistricts length: ${binsInsideDistricts.length}");

    double numberOfFull = 0, numberOfHalfFull = 0, numberOfEmpty = 0;
    // List of all bins leve that inside assigned district
    List<BinLevel> binsLevelForDistricts = [];
    for (int i = 0; i < binsLevel.length; i++) {
      for (int j = 0; j < binsInsideDistricts.length; j++) {
        if (binsInsideDistricts[j].binID == binsLevel[i].binID) {
          print("inside fill binsLevelForDistrict $j");
          binsLevelForDistricts.add(binsLevel[i]);
        }
      }
    }

    print("binsLevelForDistricts length: ${binsLevelForDistricts.length}");

    for (int i = 0; i < binsLevelForDistricts.length; i++) {
      if (binsLevelForDistricts[i].full == true)
        numberOfFull++;
      else if (binsLevelForDistricts[i].half_full == true)
        numberOfHalfFull++;
      else
        numberOfEmpty++;
    }
    print("numberOfEmpty: $numberOfEmpty");

    var pieData = [
      new PieChartData(numberOfFull, 'Full', Color(0xfff05e5e)),
      new PieChartData(numberOfHalfFull, 'Half-full', Color(0xfff19840)),
      new PieChartData(numberOfEmpty, 'Empty', Color(0xffa6ed8e)),
    ];

    _seriesPieDataForDriver = [];

    _seriesPieDataForDriver.add(
      charts.Series(
        domainFn: (PieChartData data, _) => data.state,
        measureFn: (PieChartData data, _) => data.percent,
        colorFn: (PieChartData data, _) =>
            charts.ColorUtil.fromDartColor(data.colorval),
        id: 'Bins state',
        data: pieData,
        labelAccessorFn: (PieChartData row, _) => '${row.percent}',
      ),
    );
  } //generateData

  Future<void> getLists() async {
    List<District> district;
    List<dynamic> districtDB = await readAll(tableDistrict);
    district = districtDB.cast();
    print("in get distric method");
    print("district length ${districtDB.length}");

    setState(() {
      for (int i = 0; i < district.length; i++) {
        if (district[i].driverID == driver.driverID) {
          Assigneddistricts.add(district[i]);
        }
      }
    });

    print(Assigneddistricts);

    List<BinLevel> bin;
    List<dynamic> binStatus = await readAll(tableBinLevel);
    bin = binStatus.cast();
    print("in get binsLevel method");
    print("binsLevel length ${binStatus.length}");
    binsLevel = bin;

    print("here inside getBins");
    List<Bin> binsInfo;
    List<dynamic> binDB = await readAll("bin_table");
    binsInfo = binDB.cast();
    print("in get bins method");
    print("bins length ${binDB.length}");
    setState(() {
      bins = binsInfo;
    });
    print(bins);
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
