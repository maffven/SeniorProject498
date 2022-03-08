//for admin

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter_application_1/db/DatabaseHelper.dart';
import 'package:flutter_application_1/model/District.dart';
import 'package:flutter_application_1/model/Driver.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_1/screens/DriverDashboard.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PieChartDashboard extends StatefulWidget {
  final Widget child;
  final Driver driver;
  PieChartDashboard({Key key, this.child, this.driver}) : super(key: key);

  _PieChartDashboard createState() => _PieChartDashboard(driver: driver);
}

class _PieChartDashboard extends State<PieChartDashboard> {
  final Driver driver;
  List<District> districts;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesPieData = List<charts.Series<PieChartData, String>>();
    _generateData();
    getDistricts();
  }

  _PieChartDashboard({this.driver});
  //List to store bar chart data
  List<charts.Series<PieChartData, String>> _seriesPieData;
  // items based on selected driver
  //List of drivers' districts
  //final items = [''];
  String value;
  // items for district list
//to generate data
  _generateData() {
    //data about specific district
    var pieData = [
      new PieChartData(50.0, 'Full', Color(0xfff05e5e)),
      new PieChartData(30.0, 'Half-full', Color(0xfff19840)),
      new PieChartData(20.0, 'Empty', Color(0xffa6ed8e)),
    ];

    _seriesPieData.add(
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

  @override
  /*Widget build(BuildContext context) => Scaffold(
        body: FutureBuilder<List<District>>(
          future: getDistricts(),
          builder: (context, snapshot) {
            final district = snapshot.data;
            final List items = List();
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return Center(child: CircularProgressIndicator());
              default:
                if (snapshot.hasError) {
                  return Center(child: Text("${snapshot.error}"));
                } else {
                  for (int i = 0; i < district.length; i++) {
                    if (district[i].driverID == driver.driverID) {
                      districts.add(district[i]);
                      items.add(district[i].name);
                      value = district[i].name;
                    }
                  }
                  return buildPieChart(districts, items);
                }
            }
          },
        ),
      );*/

  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
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
          body: TabBarView(
            children: [
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
                          child: charts.PieChart(_seriesPieData,
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
              Padding(
                padding: EdgeInsets.only(
                    top: 8.0, bottom: 40.0, right: 8.0, left: 8.0),
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
                              onChanged: (value) =>
                                  setState(() => this.value = value),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Expanded(
                          child: charts.PieChart(_seriesPieData,
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
            ],
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(
          item,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
        ),
      );

  //get Districts
  Future<void> getDistricts() async {
    //Get district from DB
    List<District> district;
    List<dynamic> districtDB = await readAll(tableDistrict);
    district = districtDB.cast();
    print("in get distric method");
    print("district length ${districtDB.length}");
    setState(() {
      districts = district;
    });

    print(districts);
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
