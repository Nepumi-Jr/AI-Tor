//TODO: This is just mockup main.dart file.
//* Feel free to change it to your needs.
//* You can also remove it if you don't need it.

import 'package:ai_tor_tell_you_an_appointment/screens/calendar_page.dart';
import 'package:ai_tor_tell_you_an_appointment/screens/data_list.dart';
import 'package:ai_tor_tell_you_an_appointment/screens/info_page.dart';
import 'package:flutter/material.dart';
import 'screens/home_page.dart';
import 'package:ai_tor_tell_you_an_appointment/bottomNavigation.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Basic List View',
      home: InfoPage(),

    );
  }
}

