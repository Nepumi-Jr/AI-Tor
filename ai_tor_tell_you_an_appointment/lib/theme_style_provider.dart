/*
* Code Modify from https://github.com/JohannesMilke/theme_example/blob/master/lib/provider/theme_provider.dart
* */

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeProvider() {
    // Get the current system brightness.
    final brightness = SchedulerBinding.instance.window.platformBrightness;
    if (brightness == Brightness.dark) {
      setThemeColor(Colors.cyanAccent, ThemeMode.dark);
    } else {
      setThemeColor(Colors.blueAccent, ThemeMode.light);
    }
  }

  ThemeMode themeMode = ThemeMode.system;
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

    //? check is this color should use in dark mode or light mode
    themeMode = mode;

    notifyListeners();
  }
}
