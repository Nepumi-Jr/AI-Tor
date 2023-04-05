
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:flutter/material.dart';


class DateGraphContainer extends StatefulWidget {
  const DateGraphContainer({Key? key, required this.title}) : super(key: key);
  final String title;
  
  @override
  _DateGraphContainer createState() => _DateGraphContainer();
}

class _DateGraphContainer extends State<DateGraphContainer> {
  late List<TimeData> _chartData;
  late TooltipBehavior _tooltipBehavior;
  List<TimeData> getChartData() {
    final List<TimeData> chartData = [
      TimeData(DateTime(2023, 5, 5), 0.37),
      TimeData(DateTime(2023, 5, 6), 0.05),
      TimeData(DateTime(2023, 5, 7), 0.15),
      TimeData(DateTime(2023, 5, 8), 0.13),
      TimeData(DateTime(2023, 5, 9), 0.27),
      TimeData(DateTime(2023, 5, 10), 0.03),
      TimeData(DateTime(2023, 5, 11), 0.50),
    ];
    return chartData;
  }


  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  // _StatisticsGraphState createState() => _StatisticsGraphState();
  Widget build(BuildContext context) {
  return Scaffold(
      body: SfCartesianChart(
        //backgroundColor: StyleData.backgroundColor,
        title: ChartTitle(text: 'Statistic'),                                   //graph name
        //legend: Legend(isVisible: true),                                        //icon บนกราฟ
        tooltipBehavior: _tooltipBehavior,                                      //click to help user what it do
        series: <ChartSeries>[
        ColumnSeries<TimeData, DateTime>(
          name: 'Time',
          dataSource: _chartData,
          xValueMapper: (TimeData time, _) => time.dateTime,
          yValueMapper: (TimeData time, _) => time.time,
          dataLabelSettings: const DataLabelSettings(isVisible: true),                //แสดงเลขบนกราฟ
          enableTooltip: true,
          //color: StyleData.primaryColor
        )
      ],
      primaryXAxis: DateTimeCategoryAxis(
        // intervalType: DateTimeIntervalType.days,
        interval: 1),                                             //แสดงชื่อของ bar นั้นๆ
      //primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,
      primaryYAxis: NumericAxis(minimum: 0,maximum: 1, interval: 0.25,edgeLabelPlacement: EdgeLabelPlacement.shift,
      //numberFormat: NumberFormat.decimalPercentPattern(decimalDigits: 0),
      //title: AxisTitle(text: 'Success Rate'),
      ),
      ),
      //bottomNavigationBar: BottomNavigation(focused: BottomPages.statistics),
      //drawer: const Drawer(child: Text("YOOO")),
      );
  }

  // List<TimeData> getChartData() {
  //   final List<TimeData> chartData = [
  //     TimeData(DateTime(2023, 5, 5), 0.37),
  //     TimeData(DateTime(2023, 5, 6), 0.05),
  //     TimeData(DateTime(2023, 5, 7), 0.15),
  //     TimeData(DateTime(2023, 5, 8), 0.13),
  //     TimeData(DateTime(2023, 5, 9), 0.27),
  //     TimeData(DateTime(2023, 5, 10), 0.03),
  //     TimeData(DateTime(2023, 5, 11), 0.50),
  //   ];
  //   return chartData;
  // }
}

class TimeData{
  final DateTime dateTime;
  final double time;
  TimeData(this.dateTime, this.time);
}