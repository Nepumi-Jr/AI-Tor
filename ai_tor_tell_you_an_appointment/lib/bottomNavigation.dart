import 'package:ai_tor_tell_you_an_appointment/screens/calendar/calendar_page.dart';
import 'package:ai_tor_tell_you_an_appointment/screens/home/home_page.dart';
import 'package:ai_tor_tell_you_an_appointment/screens/settings.dart';
//import 'package:ai_tor_tell_you_an_appointment/sekai/GraphPage.dart';
 import 'package:ai_tor_tell_you_an_appointment/graph/graph_page.dart';
import 'package:flutter/material.dart';
//import 'package:ai_tor_tell_you_an_appointment/styleData.dart';

enum BottomPages { home, settings, calendar, statistics }

class BottomNavigation extends StatelessWidget {
  final BottomPages focused;
  const BottomNavigation({required this.focused, super.key});

  Widget _buildBottomNavigationItem(context,
      {required IconData icon,
      required BottomPages name,
      required String text,
      void Function()? onTap}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: focused == name
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).unselectedWidgetColor,
            size: 30.0,
          ),
          onPressed: onTap,
          padding: const EdgeInsets.only(
              left: 8.0, top: 8.0, right: 8.0, bottom: 0.0),
        ),
        Text(text, style: const TextStyle(fontSize: 16.0)),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      //color: StyleData.backgroundSecondaryColor,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomNavigationItem(
              context,
              icon: Icons.home,
              name: BottomPages.home,
              text: 'Home',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SafeArea(child: HomePage())));},
            ),
            _buildBottomNavigationItem(
              context,
              icon: Icons.calendar_month,
              name: BottomPages.calendar,
              text: 'Calendar',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SafeArea(child: CalendarPage())));
              },
            ),
            _buildBottomNavigationItem(
              context,
              icon: Icons.bar_chart,
              name: BottomPages.statistics,
              text: 'Statistics',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SafeArea(child: GraphPage())));
              },
            ),
            _buildBottomNavigationItem(
              context,
              icon: Icons.settings,
              name: BottomPages.settings,
              text: 'Settings',
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SafeArea(child: Settings())));
              },
            ),
          ],
        ),
      ),
    );
  }
}
