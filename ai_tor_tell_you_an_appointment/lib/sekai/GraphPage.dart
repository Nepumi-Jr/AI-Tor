import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../bottomNavigation.dart';

enum ChartType {
  day,
  week,
  month,
}

List<double> values = [0.1, 0.2, 0.4, 0, 0.5, 0.33, 0.9,
0.0, 0.1, 0.44, 0.3, 0.74, 0.2, 0.1, 0.2, 0.4, 0, 0.5, 0.33, 0.9, 0.2
, 0.2, 0.1, 0.8, 0.9, 1, 0.4, 0.7, 0.2, 0.1, 0.2, 0.4, 0, 0.5, 0.33, 0.9, 0.2
, 0.8, 0.7, 0.5, 0.9, 0.1, 0.2, 0.1, 0.6, 0.25, 0.2, 0.4, 0.4, 0.4, 0.7, 0.7, 0.1];

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
  

  List<TimeData> _chartData = [
    TimeData(DateTime(2022, 12, 31), 0.1),
    TimeData(DateTime(2023, 1, 1), 0.2),
    TimeData(DateTime(2023, 1, 2), 0.4),
    TimeData(DateTime(2023, 1, 3), 0),
    TimeData(DateTime(2023, 1, 4), 0.5),
    TimeData(DateTime(2023, 1, 5), 0.33),
    TimeData(DateTime(2023, 1, 6), 0.9),
  ];

    @override
  void initState() {
    _chartData = _getChartData(ChartType.day);
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.blue,
                  ),
                  child: Text(
                    'AI TOR',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 50,
                    ),
                  ),
                ),
                ListTile(
                  leading:
                      const Icon(Icons.view_day_outlined, color: Colors.blue),
                  title: const Text('Day'),
                  onTap: () {
                    setState(() {
                      thisChartType1 = ChartType.day;
                      
                      
                                          _chartData = _getChartData(thisChartType1);
                    });
                  },
                ),
                ListTile(
                  leading:
                      const Icon(Icons.view_week_outlined, color: Colors.blue),
                  title: const Text('Week'),
                  onTap: () {
                    setState(() {
                                          thisChartType1 = ChartType.week;
                                         
                                          _chartData = _getChartData(thisChartType1);
                                        });
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.calendar_view_month_outlined,
                      color: Colors.blue),
                  title: const Text('Month'),
                  onTap: () {
                    setState(() {
                                          thisChartType1 = ChartType.month;
                                          
                                          _chartData = _getChartData(thisChartType1);
                                        });
                  },
                ),
              ],
            ),
          ),
          // appBar: AppBar(
          // title: const Text("Statistic"),
          // ),
          body: Container(
            color: Theme.of(context).brightness == Brightness.dark ? Colors.black45 : Colors.grey[400],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(child: Container(
                  height: 450,
                  margin: const EdgeInsets.only(top: 10,left: 10, right: 10),
                  // padding: const EdgeInsets.only(bottom: 100),
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      //child:
                      child: SfCartesianChart(
                        //backgroundColor: StyleData.backgroundColor,
                        title: ChartTitle(text: thisChartType1.name), //graph name
                        //legend: Legend(isVisible: true),                                        //icon บนกราฟ
                        tooltipBehavior: TooltipBehavior(enable: true), //click to help user what it do
                        series: <ChartSeries>[
                          ColumnSeries<TimeData, DateTime>(
                            name: 'Time',
                            dataSource: _chartData,
                            xValueMapper: (TimeData time, _) => time.dateTime,
                            yValueMapper: (TimeData time, _) => time.time,
                            dataLabelSettings:
                            const DataLabelSettings(isVisible: true), //แสดงเลขบนกราฟ
                            enableTooltip: true,
                            //color: StyleData.primaryColor
                          )
                        ],
                        primaryXAxis: DateTimeCategoryAxis(
                          // intervalType: DateTimeIntervalType.days,
                            interval: 1), //แสดงชื่อของ bar นั้นๆ
                        //primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,
                        primaryYAxis: NumericAxis(
                          minimum: 0, maximum: 1, interval: 0.25,
                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                          //numberFormat: NumberFormat.decimalPercentPattern(decimalDigits: 0),
                          //title: AxisTitle(text: 'Success Rate'),
                        ),
                      ),
                    ),
                  ),
                )),
                Expanded(child: Container(
                  height: 200, //200
                  margin: const EdgeInsets.only(top: 15, left: 10, right: 10,bottom: 15),
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(24.0),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      // child: SfCartesianChart()
                      child: SfCartesianChart(
                        //backgroundColor: StyleData.backgroundColor,
                        //title: ChartTitle(text: thisChartType1.name), //graph name
                        //legend: Legend(isVisible: true),                                        //icon บนกราฟ
                        tooltipBehavior: TooltipBehavior(enable: true), //click to help user what it do
                        series: <ChartSeries>[
                          LineSeries<TimeData, DateTime>(
                            name: 'Time',
                            dataSource: _chartData,
                            xValueMapper: (TimeData time, _) => time.dateTime,
                            yValueMapper: (TimeData time, _) => time.time,
                            dataLabelSettings:
                            const DataLabelSettings(isVisible: true), //แสดงเลขบนกราฟ
                            enableTooltip: true,
                            //color: StyleData.primaryColor
                          )
                        ],
                        primaryXAxis: DateTimeAxis(), //แสดงชื่อของ bar นั้นๆ
                        //primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,
                        primaryYAxis: NumericAxis(
                          minimum: 0, maximum: 1, interval: 0.5,
                          edgeLabelPlacement: EdgeLabelPlacement.shift,
                          numberFormat: NumberFormat.decimalPercentPattern(
                              decimalDigits: 0), //ต้อง import init
                          //title: AxisTitle(text: 'Success Rate'),
                        ),
                      ),
                    ),
                  ),
                )),
              ],
            ),
          ),
          bottomNavigationBar:
              const BottomNavigation(focused: BottomPages.statistics),
          floatingActionButton: Builder(builder: (context) {
            return FloatingActionButton(
              child: const Icon(
                Icons.view_day_outlined,
              ),

              onPressed: () =>
                  Scaffold.of(context).openDrawer(), // <-- Opens drawer.
            );
          }),
        );
  }

  List<TimeData> _getChartData(ChartType thisChartType1) {
    List<TimeData> chartData = [];
    DateTime now = DateTime.now();
    if (thisChartType1 == ChartType.day) {
        for (int i = 6; i >= 0; i--) {
          DateTime date = now.subtract(Duration(days: i));
          double value = values[i];
          chartData.add(TimeData(date, value));
        }
    } if (thisChartType1 == ChartType.week) {
        for (int i = 6,timecheck = 42; i >= 0; i--) {
          DateTime date = now.subtract(Duration(days: timecheck));
          double value = values[i * 7];
          chartData.add(TimeData(date, value));
          timecheck = timecheck - 7;
        }
    } if (thisChartType1 == ChartType.month) {
        for (int i = 6,timecheck = 180; i >= 0; i--) {
          DateTime date = now.subtract(Duration(days: timecheck));
          double value = values[i];
          chartData.add(TimeData(date, value));
          timecheck = timecheck - 30;
        }
    }
    // for (int i = 6; i >= 0; i--) {
    //   DateTime date = now.subtract(Duration(days: i));
    //   double value = values[i];
    //   chartData.add(TimeData(date, value));
    // }
    // chartData.add(TimeData(DateTime(2022, 12, 31), 0.1));
    // chartData.add(TimeData(DateTime(2022, 12, 30), 0.2));
    // chartData.add(TimeData(DateTime(2022, 12, 29), 0.0));
    // chartData.add(TimeData(DateTime(2022, 12, 28), 0.4));
    // chartData.add(TimeData(DateTime(2022, 12, 27), 0.5));
    // chartData.add(TimeData(DateTime(2022, 12, 26), 0.6));
    // chartData.add(TimeData(DateTime(2022, 12, 25), 0.7));
    return chartData;
  }

}
class TimeData{
  final DateTime dateTime;
  final double time;
  TimeData(this.dateTime, this.time);
}
