import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stocks/presentation/ticker_chart/bloc/ticker_details_bloc.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key, required this.values});

  final List<double> values;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TickerDetailsBloc, TickerDetailsState>(
        builder: (context, state) {
      return LineChart(
        sampleData1(values),
        swapAnimationDuration: const Duration(milliseconds: 250),
      );
    });
  }

  LineChartData sampleData1(List<double> values) {
    final spots = values
        .asMap()
        .map((i, element) => MapEntry(i, FlSpot(i.toDouble(), element),))
        .values
        .toList();
    return LineChartData(
      lineTouchData: lineTouchData1,
      gridData: gridData,
      titlesData: titlesData1,
      borderData: borderData,
      lineBarsData: [lineChartBarData1_1(spots)],
      minX: 0,
      maxX: values.length.toDouble(),
      maxY: values.reduce((curr, next) => curr > next? curr: next),
      minY: 0,
    );
  }

  LineTouchData get lineTouchData1 => LineTouchData(enabled: false);

  FlTitlesData get titlesData1 => FlTitlesData(
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
      );

  FlGridData get gridData => FlGridData(show: false);

  FlBorderData get borderData => FlBorderData(show: false);

  LineChartBarData lineChartBarData1_1(List<FlSpot> spots) {
    return LineChartBarData(
      isCurved: true,
      color: Colors.green,
      barWidth: 2,
      curveSmoothness: 0,
      isStrokeCapRound: true,
      dotData: FlDotData(show: false),
      belowBarData: BarAreaData(show: false),
      spots: spots,
    );
  }
}
