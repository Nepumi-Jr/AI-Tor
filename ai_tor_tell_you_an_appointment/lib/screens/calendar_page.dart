import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../bottomNavigation.dart';


class CalendarPage extends StatefulWidget {
  @override
  CalendarPageState createState() => CalendarPageState();
}

class CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: DateTime.now(),
          ),
        ),
      ),
      bottomNavigationBar: const BottomNavigation(focused: BottomPages.calendar,),
    );
  }
}