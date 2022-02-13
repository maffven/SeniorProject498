import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/Widgets/IndicatorWidget.dart';
import 'package:flutter_application_1/data/PieChartData.dart';

void main() => runApp(PieChartDashboardDemo());

class PieChartDashboardDemo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PieChartDashboard();
}

class _PieChartDashboard extends State {
// Bottom menu bar
  int touchIndex;
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Color(0xffffDD83),
          title: Text("Dashboard"),
        ),
        body: Card(
          child: Column(
            children: <Widget>[
              Expanded(
                  child: PieChart(PieChartData(
                pieTouchData: PieTouchData(touchCallback: (pieTouchResponse) {
                  setState(() {
                    if (pieTouchResponse.touchInput is FlLongPressEnd ||
                        pieTouchResponse.touchInput is FlPanEnd) {
                      touchIndex = -1;
                    } else {
                      touchIndex = pieTouchResponse.touchedSectionIndex;
                    }
                  });
                }),
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                centerSpaceRadius: 60,
                sections: Data().getSection(touchIndex),
              ))),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    child: IndicatorsWidget(),
                    padding: const EdgeInsets.only(bottom: 200),
                  ),
                ],
              )
            ],
          ),
        ),
      );
}
