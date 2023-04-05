import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../bottomNavigation.dart';
import '../data/data.dart';

enum ChartType {
  day,
  week,
  month,
}

class GraphPage extends StatefulWidget {
  const GraphPage({super.key});

  @override
  State<GraphPage> createState() => _GraphPageState();
}

class _GraphPageState extends State<GraphPage> {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey();
  ChartType thisChartType1 = ChartType.day;

  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.black45
            : Colors.grey[400],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildButtonFilter(context),
            const SizedBox(height: 10),
            Container(
              height: 400,
              margin: const EdgeInsets.only(left: 5, right: 5),
              // padding: const EdgeInsets.only(bottom: 100),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  //child:
                  child: Consumer<User>(
                    builder: (context, uData, child) {
                      List<AppointmentResult> _chartData = [];
                      DateTime now = DateTime.now();
                      if (thisChartType1 == ChartType.day) {
                        for (int i = 6; i >= 0; i--) {
                          DateTime date = now.subtract(Duration(days: i));
                          //chartData.add(Data.getDataAtDay(date)[0]);
                          _chartData.add(AppointmentResult(
                              date, uData.getExpAtDay(date) ?? 0));
                        }
                      }
                      if (thisChartType1 == ChartType.week) {
                        int sum = 0;
                        for (int timecheck = 7 * 7 - 1;
                            timecheck >= 0;
                            timecheck--) {
                          DateTime date =
                              now.subtract(Duration(days: timecheck));
                          sum += uData.getExpAtDay(date) ?? 0;
                          if (timecheck % 7 == 0) {
                            _chartData.add(AppointmentResult(date, sum));
                            sum = 0;
                          }
                        }
                      }
                      if (thisChartType1 == ChartType.month) {
                        int sum = 0;
                        for (int timecheck = 30 * 7 - 1;
                            timecheck >= 0;
                            timecheck--) {
                          DateTime date =
                              now.subtract(Duration(days: timecheck));
                          sum += uData.getExpAtDay(date) ?? 0;
                          if (timecheck % 30 == 0) {
                            _chartData.add(AppointmentResult(date, sum));
                            sum = 0;
                          }
                        }
                      }

                      return SfCartesianChart(
                        //backgroundColor: StyleData.backgroundColor,
                        title:
                            ChartTitle(text: thisChartType1.name), //graph name
                        //legend: Legend(isVisible: true),                                        //icon บนกราฟ
                        tooltipBehavior: TooltipBehavior(
                            enable: true), //click to help user what it do
                        series: <ChartSeries>[
                          ColumnSeries<AppointmentResult, DateTime>(
                              name: 'Time',
                              dataSource: _chartData,
                              xValueMapper: (AppointmentResult time, _) =>
                                  time.dateTime,
                              yValueMapper: (AppointmentResult time, _) =>
                                  time.exp,
                              dataLabelSettings: const DataLabelSettings(
                                  isVisible: true), //แสดงเลขบนกราฟ
                              enableTooltip: true,
                              color: Theme.of(context).colorScheme.primary)
                        ],
                        primaryXAxis: DateTimeCategoryAxis(
                            // intervalType: DateTimeIntervalType.days,
                            interval: 1), //แสดงชื่อของ bar นั้นๆ
                        //primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,
                        primaryYAxis: NumericAxis(
                          minimum: 0,
                          //maximum: 1,
                          //interval: 0.25,
                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                          //numberFormat: NumberFormat.decimalPercentPattern(decimalDigits: 0),
                          //title: AxisTitle(text: 'Success Rate'),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            Container(
              height: 200, //200
              margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
              child: Material(
                elevation: 4.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Consumer<User>(
                    builder: (context, uData, child) {
                      List<TimeData> _lineData = [];
                      DateTime now = DateTime.now();
                      if (thisChartType1 == ChartType.day) {
                        for (int i = 6; i >= 0; i--) {
                          DateTime date = now.subtract(Duration(days: i));
                          //double value = values[i];
                          // lineData.add(TimeData(date, value));
                          _lineData.add(TimeData(date,
                              (uData.getPercentRateAtDay(date) ?? 0) / 100));
                          //lineData.add(Data.getDataAtDay(date));
                        }
                      }
                      if (thisChartType1 == ChartType.week) {
                        for (int i = 6, timecheck = 42 + now.weekday - 1;
                            i >= 0;
                            i--) {
                          DateTime date =
                              now.subtract(Duration(days: timecheck));
                          _lineData.add(TimeData(date,
                              (uData.getPercentRateAtDay(date) ?? 0) / 100));
                          //chartData.add(Data.getDataAtWeek(date ,timecheck)[0]);
                          timecheck = timecheck - 7;
                        }
                      }
                      if (thisChartType1 == ChartType.month) {
                        for (int i = 6, timecheck = 180; i >= 0; i--) {
                          DateTime date =
                              now.subtract(Duration(days: timecheck));
                          _lineData.add(TimeData(date,
                              (uData.getPercentRateAtDay(date) ?? 0) / 100));
                          //chartData.add(AppointmentResult(date, value));
                          timecheck = timecheck - 30;
                        }
                      }

                      return SfCartesianChart(
                        //icon บนกราฟ
                        tooltipBehavior: TooltipBehavior(
                            enable: true), //click to help user what it do
                        series: <ChartSeries>[
                          LineSeries<TimeData, DateTime>(
                              name: 'Time',
                              dataSource: _lineData,
                              xValueMapper: (TimeData time, _) => time.dateTime,
                              yValueMapper: (TimeData time, _) => time.time,
                              dataLabelSettings: DataLabelSettings(
                                  isVisible: true), //แสดงเลขบนกราฟ
                              enableTooltip: true,
                              color: Theme.of(context).colorScheme.primary)
                        ],
                        primaryXAxis: DateTimeAxis(), //แสดงชื่อของ bar นั้นๆ
                        //primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,
                        primaryYAxis: NumericAxis(
                          minimum: 0, maximum: 1, interval: 0.5,
                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                          numberFormat: NumberFormat.decimalPercentPattern(
                              decimalDigits: 0), //ต้อง import init
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigation(focused: BottomPages.statistics),
    );
  }

  Widget buildButtonFilter(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 15, left: 5, right: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                thisChartType1 = ChartType.day;
              });
            },
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: thisChartType1 == ChartType.day
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Day',
                  style: TextStyle(
                    color: thisChartType1 == ChartType.day
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                thisChartType1 = ChartType.week;
              });
            },
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: thisChartType1 == ChartType.week
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Week',
                  style: TextStyle(
                    color: thisChartType1 == ChartType.week
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                thisChartType1 = ChartType.month;
              });
            },
            child: Container(
              width: 100,
              height: 30,
              decoration: BoxDecoration(
                color: thisChartType1 == ChartType.month
                    ? Theme.of(context).colorScheme.primary
                    : Colors.grey[200],
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Text(
                  'Month',
                  style: TextStyle(
                    color: thisChartType1 == ChartType.month
                        ? Colors.white
                        : Colors.black,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class TimeData {
  final DateTime dateTime;
  final double time;
  TimeData(this.dateTime, this.time);
}

class AppointmentResult {
  DateTime dateTime;
  int exp;
  AppointmentResult(this.dateTime, this.exp);

  bool isAttend() {
    return exp > 0;
  }
}
