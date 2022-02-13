import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieData {
  static List<Data> data = [
    Data(name: 'Half-full', percent: 40, color: const Color(0xfff19840)),
    Data(name: 'Empty', percent: 30, color: const Color(0xffa6ed8e)),
    Data(name: 'Full', percent: 30, color: const Color(0xfff05e5e))
  ];
}

class Data {
  final String name;
  final double percent;
  final Color color;

  Data({this.name, this.percent, this.color});

  List<PieChartSectionData> getSection(int touchedIndex) => PieData.data
      .asMap()
      .map<int, PieChartSectionData>((key, data) {
        //to check if section is touched
        final isTouched = key == touchedIndex;
        final double fontSize = isTouched ? 25 : 16;
        final double radius = isTouched ? 100 : 80;

        final value = PieChartSectionData(
          color: data.color,
          value: data.percent,
          title: '${data.percent}',
          radius: radius,
          titleStyle: TextStyle(
            fontSize: fontSize,
            fontWeight: FontWeight.bold,
            color: const Color(0xffffffff),
          ),
        );
        return MapEntry(key, value);
      })
      .values
      .toList();
}
