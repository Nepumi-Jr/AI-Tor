import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import '../bottomNavigation.dart';

class RunTEST extends StatefulWidget {
  const RunTEST({super.key});

  @override
  State<RunTEST> createState() => _RunTESTState();
  
}

class _RunTESTState extends State<RunTEST> {
  // final scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<ScaffoldState> _key = GlobalKey(); 

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Widgets",
      // home: MyName(),
      home: Scaffold(
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
                child: Text('AI TOR',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50,
                  ),
                ),
              ),
              ListTile(
                leading: const Icon(Icons.view_day_outlined,color: Colors.blue),
                title: const Text('Day'),
                onTap: () {
                  setState(() {
                    // chartData = <TimeData>[];
                    // chartData = _getChartData();
                    //addSeries();
                  });
                },
              ),
              ListTile(
                leading: const Icon(Icons.view_week_outlined,color: Colors.blue),
                title: const Text('Week'),
                onTap: () {
                  
                },
              ),
              ListTile(
                leading: const Icon(Icons.calendar_view_month_outlined,color: Colors.blue),
                title: const Text('Month'),
                onTap: () {
                  
                },
              ),
            ],
          ),
        ),
        // appBar: AppBar(
        // title: const Text("Statistic"),
        // ),
        body: Container(
            color: Colors.yellow[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 450,
                  margin: const EdgeInsets.only(left: 5,right: 5),
                  // padding: const EdgeInsets.only(bottom: 100),
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: const Color(0x802196F3),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      // child: SfCartesianChart()
                      child: DateGraphContainer(title: "graph"),
                      ),
                  ),
                ),
                Container(
                  height: 200, //200
                  margin: const EdgeInsets.only(top: 15,left: 5,right: 5),
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: const Color(0x802196F3),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      // child: SfCartesianChart()
                      child: LineGraphContainer(title: "graph"),
                      ),
                  ),
                ),
                // ElevatedButton(onPressed: () {
                //   scaffoldKey.currentState!.openDrawer();
                // }, 
                // child: Text("Drawer"))
             ],
            ),
          ),
          bottomNavigationBar: const BottomNavigation(focused: BottomPages.statistics),
          floatingActionButton: Builder(builder: (context) {
            return FloatingActionButton(
              child: const Icon(Icons.view_day_outlined),
              onPressed: () => Scaffold.of(context).openDrawer(), // <-- Opens drawer.
            );
          }),
        )
        );
  }
}

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

  /// Add series into the chart.
  void addSeries() {
    final List<TimeData> chartData1 = <TimeData>[];
    for (int i = 0; i <= 7; i++) {
      chartData1.add(TimeData(DateTime(2023, 5, 10), 0.03),);
    }
    // series.add(ColumnSeries<TimeData, DateTime>(
    //   key: ValueKey<String>('${series.length}'),
    //   dataSource: chartData1,
    //   xValueMapper: (TimeData time, _) => time.dateTime,
    //   yValueMapper: (TimeData time, _) => time.time,
    // ));
  }                       
}

class TimeData{
  final DateTime dateTime;
  final double time;
  TimeData(this.dateTime, this.time);
}

class LineGraphContainer extends StatefulWidget {
  const LineGraphContainer({Key? key, required this.title}) : super(key: key);
  final String title;
  
  @override
  _LineGraphContainer createState() => _LineGraphContainer();
}

class _LineGraphContainer extends State<LineGraphContainer> {
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
        LineSeries<TimeData, DateTime>(
          name: 'Time',
          dataSource: _chartData,
          xValueMapper: (TimeData time, _) => time.dateTime,
          yValueMapper: (TimeData time, _) => time.time,
          dataLabelSettings: const DataLabelSettings(isVisible: true),                //แสดงเลขบนกราฟ
          enableTooltip: true,
          //color: StyleData.primaryColor
        )
      ],
      primaryXAxis: DateTimeAxis(),                                             //แสดงชื่อของ bar นั้นๆ
      //primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift,
      primaryYAxis: NumericAxis(minimum: 0,maximum: 1, interval: 0.5,edgeLabelPlacement: EdgeLabelPlacement.shift,
      numberFormat: NumberFormat.decimalPercentPattern(decimalDigits: 0),       //ต้อง import init
      //title: AxisTitle(text: 'Success Rate'),
      ),
      ),
      //bottomNavigationBar: BottomNavigation(focused: BottomPages.statistics),
      //drawer: const Drawer(child: Text("YOOO")),
      );
  }
}
