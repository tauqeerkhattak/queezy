import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:queezy/utils/constants.dart';
import 'package:queezy/widgets/title_text.dart';

class CustomPieChart extends StatelessWidget {
  final double value1, value2, radius;

  const CustomPieChart({
    Key? key,
    required this.value1,
    required this.value2,
    required this.radius,
  })  : assert(
          value1 + value2 == 100,
          'Sum of both values must be equal to 100.',
        ),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PieChart(
          PieChartData(
            centerSpaceRadius: 0.0,
            sectionsSpace: 0.0,
            startDegreeOffset: 270,
            sections: [
              PieChartSectionData(
                value: value1,
                showTitle: false,
                color: Constants.pink,
                radius: radius,
              ),
              PieChartSectionData(
                value: value2,
                showTitle: false,
                color: Constants.pink.withOpacity(0.3),
                radius: radius,
              ),
            ],
          ),
        ),
        Center(
          child: TitleText(
            text: '${value1.toInt()}%',
            size: Constants.bodySmall,
            weight: FontWeight.w500,
            textColor: Constants.white,
          ),
        ),
      ],
    );
  }
}
