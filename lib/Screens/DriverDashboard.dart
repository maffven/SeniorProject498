//for driver

import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class BarAndPieChartDashboard extends StatefulWidget {
  final Widget child;

  BarAndPieChartDashboard({Key key, this.child}) : super(key: key);

  _BarAndPieChartDashboard createState() => _BarAndPieChartDashboard();
}

class _BarAndPieChartDashboard extends State<BarAndPieChartDashboard> {
  //List to store bar chart data
  List<charts.Series<BarChartData, String>> _seriesData;
  List<charts.Series<PieChartData, String>> _seriesPieData;
  // items for district list
  final items = ['Alnaseem', 'Alwaha', 'Alrawda'];
  String value;

//to generate data
  _generateData() {
    var barData1 = [
      //number of bins
      new BarChartData("Alnaseem", "Empty", 30),
      new BarChartData("Alrawda", "Empty", 40),
      new BarChartData("Alwaha", "Empty", 50),
    ];
    var barData2 = [
      new BarChartData("Alnaseem", 'full', 40),
      new BarChartData("Alrawda", 'full', 10),
      new BarChartData("Alwaha", 'full', 10),
    ];
    var barData3 = [
      new BarChartData("Alnaseem", 'half-full', 50),
      new BarChartData("Alrawda", 'half-full', 30),
      new BarChartData("Alwaha", 'half-full', 10),
    ];

    var pieData = [
      new PieChartData(50.0, 'Full', Color(0xfff05e5e)),
      new PieChartData(30.0, 'Half-full', Color(0xfff19840)),
      new PieChartData(20.0, 'Empty', Color(0xffa6ed8e)),
    ];

    //First district
    _seriesData.add(
      charts.Series(
        domainFn: (BarChartData data, _) => data.distictName,
        measureFn: (BarChartData data, _) => data.numberOfBins,
        id: 'Anaseem',
        data: barData1,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (BarChartData data, _) =>
            charts.ColorUtil.fromDartColor(Color(0xffa6ed8e)),
      ),
    );
    //second district
    _seriesData.add(
      charts.Series(
        domainFn: (BarChartData data, _) => data.distictName,
        measureFn: (BarChartData data, _) => data.numberOfBins,
        id: 'Alrawda',
        data: barData2,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (BarChartData data, _) =>
            charts.ColorUtil.fromDartColor(Color(0xfff05e5e)),
      ),
    );

    //Third district
    _seriesData.add(
      charts.Series(
        domainFn: (BarChartData data, _) => data.distictName,
        measureFn: (BarChartData data, _) => data.numberOfBins,
        id: 'Alwaha',
        data: barData3,
        fillPatternFn: (_, __) => charts.FillPatternType.solid,
        fillColorFn: (BarChartData data, _) =>
            charts.ColorUtil.fromDartColor(Color(0xfff19840)),
      ),
    );

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
  void initState() {
    // TODO: implement initState
    super.initState();
    _seriesData = List<charts.Series<BarChartData, String>>();
    _seriesPieData = List<charts.Series<PieChartData, String>>();
    _generateData();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          /*appBar: AppBar(
            backgroundColor: Color(0xffffDD83),
            title: Text("Dashboard"),
          ),*/
          appBar: AppBar(
            backgroundColor: Color(0xffffDD83),
            title: Text("Dashboard"),
            bottom: TabBar(
              indicatorColor: Colors.white,
              tabs: [
                Tab(
                  icon: Icon(FontAwesomeIcons.solidChartBar),
                ),
                Tab(icon: Icon(FontAwesomeIcons.chartPie)),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Padding(
                padding:
                    EdgeInsets.only(bottom: 85.0, top: 10, left: 20, right: 20),
                child: Container(
                  child: Center(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          child: charts.BarChart(
                            _seriesData,
                            animate: true,
                            barGroupingType: charts.BarGroupingType.grouped,
                            //behaviors: [new charts.SeriesLegend()],
                            animationDuration: Duration(seconds: 1),
                          ),
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
                            child: DropdownButton<String>(
                              iconSize: 36,
                              icon: Icon(
                                Icons.arrow_drop_down_outlined,
                                color: Color(0xff28CC9E),
                              ),
                              value: value,
                              items: items.map(buildMenuItem).toList(),
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
}

//For bar chart data
class BarChartData {
  String distictName;
  double numberOfBins;
  String state; // full, half, empty

  BarChartData(this.distictName, this.state, this.numberOfBins);
}

class PieChartData {
  double percent;
  String state; // full, half, empty
  Color colorval;

  PieChartData(this.percent, this.state, this.colorval);
}
