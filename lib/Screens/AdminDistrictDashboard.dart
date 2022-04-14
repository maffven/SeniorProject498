import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Screens/AdminDashboard.dart';
import 'package:flutter_application_1/Screens/AdminDriverDashboard.dart';
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

void main() => runApp(MaterialApp(home: AdminDistrictDashboard()));

class AdminDistrictDashboard extends StatefulWidget {
  final Driver driver;
  @override
  AdminDistrictDashboard({Key key, this.driver}) : super(key: key);
  _AdminDistrictDashboard createState() =>
      _AdminDistrictDashboard(driver: driver);
}

class _AdminDistrictDashboard extends State<AdminDistrictDashboard> {
//Define variables
  final Driver driver;
  List<District> districts = [];
  List<Bin> bins;
  List<BinLevel> binsLevel;
  List<BinLevel> binsLevelForSelectedDistrict = [];
  String value;
  List<charts.Series<PieChartData, String>> _seriesPieDataForDistrict;
  District selectedDistrict;
  _AdminDistrictDashboard({this.driver});

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLists().whenComplete(() {
      setState(() {});
    });
    _seriesPieDataForDistrict = List<charts.Series<PieChartData, String>>();
  }

  @override
  Widget build(BuildContext context) {
    _generateDataForDistrict();
    return DefaultTabController(
        length: 1,
        child: Scaffold(
          body: Padding(
            padding:
                EdgeInsets.only(top: 8.0, bottom: 40.0, right: 8.0, left: 8.0),
            child: Container(
              child: Center(
                child: Column(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 70.0),
                      padding:
                          EdgeInsets.symmetric(horizontal: 12, vertical: 1),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Color(0xff28CC9E),
                          width: 1,
                        ),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton(
                          hint: Text("Select district"),
                          iconSize: 36,
                          icon: Icon(
                            Icons.arrow_drop_down_outlined,
                            color: Color(0xff28CC9E),
                          ),
                          value: value,
                          items: districts.map((item) {
                            return DropdownMenuItem(
                                value: item.name, child: Text(item.name));
                          }).toList(),
                          onChanged: (value) => setState(() {
                            this.value = value;
                          }),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Expanded(
                      child: charts.PieChart(_seriesPieDataForDistrict,
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
                                  color: charts.MaterialPalette.black.darker,
                                  fontFamily: 'Arial',
                                  fontSize: 15),
                            )
                          ],
                          defaultRenderer: new charts.ArcRendererConfig(
                              arcWidth: 80,
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
        ));
  }

//Class methods

  _fillSelectedDistrict() {
    //data about specific district

    for (int i = 0; i < districts.length; i++) {
      if (value != null && value == districts[i].name) {
        print("val: $value");
        selectedDistrict = districts[i];
        break;
      }
    }
  }

  _generateDataForDistrict() {
    _fillSelectedDistrict();
    //print("district name: ${district.name}");

    //To show piechart based on specific district
    // bool check = false;
    List<Bin> binsInsideSelectedDistrict = [];
    if (selectedDistrict != null) {
      for (int i = 0; i < bins.length; i++) {
        if (bins[i].districtId == selectedDistrict.districtID) {
          binsInsideSelectedDistrict.add(bins[i]);
        }
      }
    }

    bool check = false;
    for (int j = 0; j < binsLevel.length; j++) {
      for (int k = 0; k < binsInsideSelectedDistrict.length; k++) {
        //       print("inside binsLevel $j");
        if (binsInsideSelectedDistrict[k].binID == binsLevel[j].binID) {
          //         print("inside second if");
          check = true;
          binsLevelForSelectedDistrict.add(binsLevel[j]);
          //       }
        }
      }
    }

    // //print("binsLevelForDistrict length ${binsLevelForDistrict.length}");
    // double numberOfFull = 0, numberOfHalfFull = 0, numberOfEmpty = 0;
    // for (int i = 0; i < binsLevelForDistrict.length; i++) {
    //   if (binsLevelForDistrict[i].full == true) {
    //     numberOfFull++;
    //   } else if (binsLevelForDistrict[i].half_full == true) {
    //     numberOfHalfFull++;
    //   } else {
    //     numberOfEmpty++;
    //   }
    // }
    double numberOfFull = 0, numberOfHalfFull = 0, numberOfEmpty = 0;

    for (int i = 0; i < binsLevelForSelectedDistrict.length; i++) {
      if (binsLevelForSelectedDistrict[i].full == true)
        numberOfFull++;
      else if (binsLevelForSelectedDistrict[i].half_full == true)
        numberOfHalfFull++;
      else
        numberOfEmpty++;
    }

    var pieData = [
      new PieChartData(numberOfFull, 'Full', Color(0xfff05e5e)),
      new PieChartData(numberOfHalfFull, 'Half-full', Color(0xfff19840)),
      new PieChartData(numberOfEmpty, 'Empty', Color(0xffa6ed8e)),
    ];
    if (check) {
      print("yes there");
      _seriesPieDataForDistrict = [];

      _seriesPieDataForDistrict.add(
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
    } else {
      _seriesPieDataForDistrict = [];
      print("empty");
    }
  }

//to get district lists, bins list, and bins level list
  Future<void> getLists() async {
    List<District> district;
    List<dynamic> districtDB = await readAll(tableDistrict);
    district = districtDB.cast();
    print("in get distric method");
    print("district length ${districtDB.length}");

    setState(() {
      for (int i = 0; i < district.length; i++) {
        if (district[i].driverID == driver.driverID) {
          districts.add(district[i]);
        }
      }
    });

    print(districts);

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