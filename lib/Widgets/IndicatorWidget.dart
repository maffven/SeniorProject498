import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/PieChartData.dart';

class IndicatorsWidget extends StatelessWidget {
  Widget build(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //to create rows decribtion
        children: PieData.data
            .map((data) => Container(
                padding: EdgeInsets.symmetric(vertical: 2),
                child: buildIndicator(color: data.color, text: data.name)))
            .toList(),
      );
  Widget buildIndicator({
    @required Color color,
    @required String text,
    bool isSquare = true,
    double size = 16,
    Color textColor = const Color(0xff505050),
  }) =>
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          //square of describtion
          Container(
            width: size,
            height: size,
            decoration: BoxDecoration(
              shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
              color: color,
            ),
          ),
          //Spces between text
          const SizedBox(width: 8),
          Text(
            text,
            style: TextStyle(
                fontSize: 16, fontWeight: FontWeight.bold, color: textColor),
          )
        ],
      );
}
