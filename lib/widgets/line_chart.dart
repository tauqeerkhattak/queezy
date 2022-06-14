import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:queezy/widgets/title_text.dart';

import '../utils/constants.dart';

class CustomLineChart extends StatelessWidget {
  final linearbardata;

  const CustomLineChart({this.linearbardata, Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return LineChart(LineChartData(
        lineTouchData: LineTouchData(enabled: true),
        borderData: FlBorderData(
            show: true,
            border: Border(
                bottom: BorderSide(),
                top: BorderSide.none,
                left: BorderSide.none,
                right: BorderSide.none)),
        gridData: FlGridData(
          show: true,
          drawVerticalLine: false,
          drawHorizontalLine: true,
        ),
        minX: 1,
        maxX: 10,
        minY: 0,
        maxY: 1,
        titlesData: FlTitlesData(
            bottomTitles: AxisTitles(
                sideTitles: SideTitles(
                    reservedSize: 30.0,
                    showTitles: true,
                    getTitlesWidget: (double value, TitleMeta data) {
                      return Container(
                        margin: EdgeInsets.only(top: 8),
                        child: TitleText(
                          text: "${value.toInt()}",
                          size: Constants.bodySmall,
                        ),
                      );
                    })),
            leftTitles: AxisTitles(),
            rightTitles: AxisTitles(),
            topTitles: AxisTitles()),
        lineBarsData: linearbardata));
  }
}
