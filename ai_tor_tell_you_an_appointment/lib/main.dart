//TODO: This is just mockup main.dart file.
//* Feel free to change it to your needs.
//* You can also remove it if you don't need it.

import 'package:ai_tor_tell_you_an_appointment/screens/calendar/calendar_page.dart';
import 'package:ai_tor_tell_you_an_appointment/screens/calendar/info_page.dart';
import 'package:ai_tor_tell_you_an_appointment/theme_style_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'backend/faceImage.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    builder: (context, _) {
      final themeProvider = Provider.of<ThemeProvider>(context);
      FaceImage.loadSetImage();
      return MaterialApp(
        title: 'Flutter Demo',
        themeMode: themeProvider.themeMode,
        theme: themeProvider.lightTheme,
        darkTheme: themeProvider.darkTheme,
        debugShowCheckedModeBanner: false,
        home: SafeArea(
          child: CalendarPage(),
        ),
      );
    },
  );
}
