import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      width: 350,
      height: 200,
      child: LineChart(
        LineChartData(
            borderData: FlBorderData(show: false),
            gridData: FlGridData(show: true,drawVerticalLine: false,drawHorizontalLine: true,horizontalInterval: 1.5),
            minX: 0,
            maxX: 11,
            minY: 0,
            maxY: 6,
            titlesData: FlTitlesData(
              rightTitles: SideTitles(showTitles: false),
              topTitles: SideTitles(showTitles: false),
              leftTitles: SideTitles(showTitles: false),
                show: true,
                bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 1,
                    interval: 1,
                    getTextStyles: (context, value) =>  TextStyle(
                          color: Colors.white.withOpacity(0.4),
                          fontWeight: FontWeight.bold,
                          fontSize: 10,
                        ),
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 0:
                          return "JAN";
                        case 1:
                          return "FEB";
                        case 2:
                          return "MAR";
                        case 3:
                          return "APR";
                        case 4:
                          return "MAY";
                        case 5:
                          return "JUN";
                        case 6:
                          return "JUL";
                        case 7:
                          return "AUG";
                        case 8:
                          return "SEP";
                        case 9:
                          return "OCT";
                        case 10:
                          return "NOV";
                        case 11:
                          return "DEC";
                      }
                      return "";
                    
                    },
                    margin: 10,
                    )),
      lineTouchData: LineTouchData(
        getTouchedSpotIndicator:
            (LineChartBarData barData, List<int> spotIndexes) {
          return spotIndexes.map((index) {
            return TouchedSpotIndicatorData(
              FlLine(
                color: Colors.white.withOpacity(0.1),
                strokeWidth: 2,
                dashArray: [3, 3],
              ),
              FlDotData(
                show: false,
                getDotPainter: (spot, percent, barData, index) =>
                    FlDotCirclePainter(
                  radius: 8,
                  color: [
                    Colors.black,
                    Colors.black,
                  ][index],
                  strokeWidth: 1,
                  strokeColor: Colors.black,
                ),
              ),
            );
          }).toList();
        },
        enabled: true,
        touchTooltipData: LineTouchTooltipData(
          tooltipPadding: const EdgeInsets.all(10),
          tooltipRoundedRadius: 30,
          tooltipBgColor: const Color(0xff2e3747).withOpacity(0.8),
          getTooltipItems: (touchedSpots) {
            return touchedSpots.map((touchedSpot) {
              return LineTooltipItem(
                '\$${touchedSpot.y.round() * 523}.00',
                const TextStyle(color: Colors.white, fontSize: 12.0),
              );
            }).toList();
          },
        ),
        handleBuiltInTouches: true,
      ),
            lineBarsData: [
              LineChartBarData(
                  spots: const [
                    FlSpot(0, 1),
                    FlSpot(1, 2),
                    FlSpot(2, 1),
                    FlSpot(3, 2),
                    FlSpot(4, 1),
                    FlSpot(5, 4),
                    FlSpot(6, 2),
                    FlSpot(7, 1),
                    FlSpot(8, 2),
                    FlSpot(9, 4),
                    FlSpot(10, 3),
                  ],
                  isCurved: true,
                  colors: [const Color(0xFFFF00FF)],
                  barWidth: 5,
                  dotData: FlDotData(show: false)),
            ]),
        swapAnimationCurve: Curves.bounceInOut,
        swapAnimationDuration: const Duration(milliseconds: 1000),
      ),
    );
  }
}
