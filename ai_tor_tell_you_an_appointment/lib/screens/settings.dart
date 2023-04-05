import 'package:ai_tor_tell_you_an_appointment/screens/about_page.dart';
import 'package:flutter/material.dart';
import 'package:ai_tor_tell_you_an_appointment/bottomNavigation.dart';
import 'package:ai_tor_tell_you_an_appointment/screens/color_theme.dart';
import 'package:ai_tor_tell_you_an_appointment/screens/faceSetting.dart';
import 'package:ai_tor_tell_you_an_appointment/backend/LangManager.dart';
import 'package:ai_tor_tell_you_an_appointment/screens/about_page.dart';
import '../theme_style_provider.dart';
import 'color_theme.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  _SettingsPage createState() => _SettingsPage();
}

class _SettingsPage extends State<SettingsPage> {
  Color pickerColor = Colors.tealAccent; // = StyleData.primaryColor;
  ThemeMode pickThemeMode = ThemeMode.light; // = StyleData.themeMode;

  void changeColor(Color color) {
    pickerColor = color;
  }

  Widget _buildSettingRow(
      {required String text, required IconData icon, IconData? arrow = Icons.arrow_forward_ios, void Function()? onTap}) {
    return ListTile(
      leading: Icon(icon),
      iconColor: Theme.of(context).colorScheme.primary,
      title: Text(text),
      trailing:
        Icon(arrow), //, color: StyleData.primaryColor),
      onTap: onTap,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
            top: 10.0, bottom: 16.0, left: 16.0, right: 16.0),
        child: Column(
          children: <Widget>[
            _buildSettingRow(
              text: LangMan.get().setting.menuColor,
              icon: Icons.color_lens,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const ColorTheme()));
              },
            ),
            const SizedBox(height: 12.0),
            _buildSettingRow(
              text: LangMan.get().setting.menuFaceImage,
              icon: Icons.image,
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const FaceSettings()));
              },
            ),
            const SizedBox(height: 12.0),
            _buildSettingRow(
              text: 'Log out',
              icon: Icons.logout,
              onTap: () {
                // TODO: LOGOUT
              },
              arrow: null
            ),
          ],
        ),
      ),
      bottomNavigationBar:
          const BottomNavigation(focused: BottomPages.settings),
    );
  }
}

class LightDarkSelector extends StatefulWidget {
  final Color colorSelected;
  final ValueChanged<ThemeMode> onThemeModeChanged;
  const LightDarkSelector(this.colorSelected,
      {required this.onThemeModeChanged, super.key});

  @override
  _LightDarkSelector createState() => _LightDarkSelector();
}

class _LightDarkSelector extends State<LightDarkSelector> {
  ThemeMode pickThemeMode = ThemeMode.light; // = StyleData.themeMode;
  late final ThemeMode recommendedThemeMode;

  @override
  void initState() {
    super.initState();
    if (ThemeProvider.shouldUseDarkTheme(widget.colorSelected)) {
      pickThemeMode = ThemeMode.dark;
    } else {
      pickThemeMode = ThemeMode.light;
    }
    recommendedThemeMode = pickThemeMode;
    widget.onThemeModeChanged(pickThemeMode);
  }

  @override
  Widget build(BuildContext context) {
    var columnContent = <Widget>[
      RadioListTile<ThemeMode>(
        title: Row(
          children: const <Widget>[
            Icon(Icons.wb_sunny),
            SizedBox(width: 8),
            Text('Light'),
          ],
        ),
        value: ThemeMode.light,
        groupValue: pickThemeMode,
        onChanged: (ThemeMode? value) {
          setState(() {
            pickThemeMode = value!;
            widget.onThemeModeChanged(pickThemeMode);
          });
        },
      ),
      RadioListTile<ThemeMode>(
        title: Row(
          children: const <Widget>[
            Icon(Icons.nightlight_round),
            SizedBox(width: 8),
            Text('Dark'),
          ],
        ),
        value: ThemeMode.dark,
        groupValue: pickThemeMode,
        onChanged: (ThemeMode? value) {
          setState(() {
            pickThemeMode = value!;
            widget.onThemeModeChanged(pickThemeMode);
          });
        },
      ),
    ];

    if (pickThemeMode != recommendedThemeMode) {
      columnContent.add(
        const Text("Not recommended for your color theme.",
            style: TextStyle(color: Colors.red)),
      );
    } else {
      columnContent.add(
        const Text("Not recommended for your color theme.",
            style: TextStyle(color: Color.fromARGB(0, 255, 255, 255))),
      );
    }

    return Column(
      children: columnContent,
    );
  }
}
