import 'package:flutter/material.dart';

class BottomNavigation extends StatelessWidget {
  final String focused;
  const BottomNavigation({required this.focused, super.key});

  Widget _buildBottomNavigationItem(
      {required IconData icon,
      required String name,
      required String text,
      void Function()? onTap}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(
            icon,
            color: focused == name ? Colors.blue : Colors.grey,
            size: 30.0,
          ),
          onPressed: onTap,
          padding: const EdgeInsets.only(
              left: 8.0, top: 8.0, right: 8.0, bottom: 0.0),
        ),
        Text(text),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8
            .0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildBottomNavigationItem(
              icon: Icons.home,
              name: 'home',
              text: 'Home',
              onTap: () {
                //TODO : Navigate to home page
              },
            ),
            _buildBottomNavigationItem(
              icon: Icons.calendar_month,
              name: 'calendar',
              text: 'Calendar',
              onTap: () {
                //TODO : Navigate to home page
              },
            ),
            _buildBottomNavigationItem(
              icon: Icons.bar_chart,
              name: 'statistics',
              text: 'Statistics',
              onTap: () {
                //TODO : Navigate to home page
              },
            ),
            _buildBottomNavigationItem(
              icon: Icons.settings,
              name: 'settings',
              text: 'Settings',
              onTap: () {
                //TODO : Navigate to home page
              },
            ),
          ],
        ),
      ),
    );
  }
}
