/*
* Code Modify from https://github.com/JohannesMilke/theme_example/blob/master/lib/provider/theme_provider.dart
* */

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    loadThemeColor();
  }

  ThemeMode themeMode = ThemeMode.system;
  Color primaryColor = Colors.blueAccent;
  ThemeData darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(),
  );

  ThemeData lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light(),
  );

  bool get isDarkMode {
    if (themeMode == ThemeMode.system) {
      final brightness = SchedulerBinding.instance.window.platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return themeMode == ThemeMode.dark;
    }
  }

  void toggleTheme(bool isOn) {
    themeMode = isOn ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }

  static bool shouldUseDarkTheme(Color color) {
    return color.computeLuminance() >= 0.5;
  }

  void setThemeColor(Color color, ThemeMode mode) {
    darkTheme = darkTheme.copyWith(
      primaryColor: color,
      colorScheme: darkTheme.colorScheme.copyWith(primary: color),
    );
    lightTheme = lightTheme.copyWith(
      primaryColor: color,
      colorScheme: lightTheme.colorScheme.copyWith(primary: color),
    );
    primaryColor = color;
    //? check is this color should use in dark mode or light mode
    themeMode = mode;
    notifyListeners();
  }

  Future<void> saveThemeColor() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt("setting_color_r", primaryColor.red);
    await prefs.setInt("setting_color_g", primaryColor.green);
    await prefs.setInt("setting_color_b", primaryColor.blue);

    await prefs.setBool("setting_dark_theme", themeMode == ThemeMode.dark);
  }

  Future<void> loadThemeColor() async {
    final prefs = await SharedPreferences.getInstance();
    final brightness = SchedulerBinding.instance.window.platformBrightness;

    final Color defaultColor;
    final bool isDarkMode;

    if (brightness == Brightness.dark) {
      //? dark mode
      defaultColor = Colors.cyanAccent;
      isDarkMode = true;
    } else {
      defaultColor = Colors.blueAccent;
      isDarkMode = false;
    }

    final int r = prefs.getInt('setting_color_r') ?? defaultColor.red;
    final int g = prefs.getInt('setting_color_g') ?? defaultColor.green;
    final int b = prefs.getInt('setting_color_b') ?? defaultColor.blue;

    setThemeColor(
        Color.fromARGB(255, r, g, b),
        (prefs.getBool('setting_dark_theme') ?? isDarkMode)
            ? ThemeMode.dark
            : ThemeMode.light);
  }
}
