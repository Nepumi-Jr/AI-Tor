import 'package:flutter/material.dart';

import 'package:syncfusion_flutter_charts/charts.dart';
import '../bottomNavigation.dart';

import 'column_date_container.dart';
import 'line_date_container.dart';

class RunApp extends StatefulWidget {
  const RunApp({super.key});

  @override
  State<RunApp> createState() => _RunAppState();
  
}

class _RunAppState extends State<RunApp> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  

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
                    // chartData = <ChartSampleData>[];
                    // chartData = _getChartData();
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
        appBar: AppBar(
        title: const Text("Statistic"),
        ),
        body: Container(
            color: Colors.yellow[100],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  height: 400,
                  margin: const EdgeInsets.only(left: 5,right: 5),
                  // padding: const EdgeInsets.only(bottom: 100),
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      // child: SfCartesianChart()
                      child: DateGraphContainer(title: "graph"),
                      ),
                  ),
                ),
                Container(
                  height: 200,
                  margin: const EdgeInsets.only(top: 15,left: 5,right: 5),
                  child: Material(
                    elevation: 4.0,
                    borderRadius: BorderRadius.circular(24.0),
                    shadowColor: Color(0x802196F3),
                    child: Padding(
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
          bottomNavigationBar: BottomNavigation(focused: BottomPages.statistics),
        )
        );
  }
}
