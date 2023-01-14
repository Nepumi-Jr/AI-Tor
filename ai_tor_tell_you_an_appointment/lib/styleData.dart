import 'package:flutter/material.dart';

class StyleData {
  static Color primaryColor = Colors.blueAccent;

  static Color textPrimaryColor = Colors.black;
  static Color textSecondaryColor = Colors.black26;
  static Color textTertiaryColor = Colors.white24;

  static Color backgroundColor = Colors.white;
  static Color backgroundSecondaryColor = Colors.white70;

  static Widget text(String text,
      {double fontSize = 24.0,
      Color? color,
      fontStyle = FontStyle.normal,
      fontWeight = FontWeight.normal}) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        color: color ?? textPrimaryColor,
        fontStyle: fontStyle,
        fontWeight: fontWeight,
      ),
    );
  }

  static Widget textMainColor(String text, {double fontSize = 24.0}) {
    return StyleData.text(text, fontSize: fontSize, color: primaryColor);
  }

  static void changeThemeColor(Color color) {
    primaryColor = color;
    //? check is this color should use in dark text or light text
    if (color.computeLuminance() > 0.5) {
      textPrimaryColor = Colors.black;
      textSecondaryColor = Colors.black26;
      textTertiaryColor = Colors.white24;

      backgroundColor = Colors.white;
      backgroundSecondaryColor = Colors.white70;
    } else {
      textPrimaryColor = Colors.white;
      textSecondaryColor = Colors.white70;
      textTertiaryColor = Colors.white24;

      backgroundColor = Colors.black26;
      backgroundSecondaryColor = Colors.white10;
    }
  }
}
