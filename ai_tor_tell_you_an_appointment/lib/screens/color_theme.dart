import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:ai_tor_tell_you_an_appointment/theme_style_provider.dart';

class colorTheme extends StatelessWidget {
  const colorTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Color Theme"),
      ),
      body: const ColorThemeContent(),
    );
  }
}

class ColorThemeContent extends StatefulWidget {
  const ColorThemeContent({Key? key}) : super(key: key);

  @override
  State<ColorThemeContent> createState() => _ColorThemeContentState();
}

class _ColorThemeContentState extends State<ColorThemeContent> {
  ThemeMode recommendedThemeMode = ThemeMode.light;
  Color pickerColor = Colors.tealAccent; // = StyleData.primaryColor;
  ThemeMode pickThemeMode = ThemeMode.light; // = StyleData.themeMode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    pickerColor = Theme.of(context).colorScheme.primary;

    final provider = Provider.of<ThemeProvider>(context, listen: false);
    autoRecommendedThemeMode(pickerColor);
    pickThemeMode = provider.themeMode;
  }

  void changeColor(Color color) {
    pickerColor = color;
    autoRecommendedThemeMode(pickerColor);
    setState(() {});
  }

  void autoRecommendedThemeMode(Color color) {
    if (ThemeProvider.shouldUseDarkTheme(color)) {
      pickThemeMode = ThemeMode.dark;
    } else {
      pickThemeMode = ThemeMode.light;
    }
    recommendedThemeMode = pickThemeMode;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, top: 30, right: 20, bottom: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          HueRingPicker(
            pickerColor: pickerColor,
            onColorChanged: changeColor,
            enableAlpha: false,
            displayThumbColor: true,
          ),
          Container(
            margin: EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                Row(
                  children: const <Widget>[
                    Expanded(
                      child: Text(
                        "Tone of Theme",
                        style: TextStyle(fontSize: 24),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 20),
                RadioListTile<ThemeMode>(
                  title: Row(
                    children: const <Widget>[
                      Icon(Icons.wb_sunny),
                      SizedBox(width: 8),
                      Text('Light Theme'),
                    ],
                  ),
                  value: ThemeMode.light,
                  groupValue: pickThemeMode,
                  onChanged: (ThemeMode? value) {
                    setState(() {
                      pickThemeMode = value!;
                    });
                  },
                ),
                RadioListTile<ThemeMode>(
                  title: Row(
                    children: const <Widget>[
                      Icon(Icons.nightlight_round),
                      SizedBox(width: 8),
                      Text('Dark Theme'),
                    ],
                  ),
                  value: ThemeMode.dark,
                  groupValue: pickThemeMode,
                  onChanged: (ThemeMode? value) {
                    setState(() {
                      pickThemeMode = value!;
                    });
                  },
                ),
                Text(
                  "Not recommended for your color theme.",
                  style: TextStyle(
                    color: Color.fromARGB(
                        (pickThemeMode != recommendedThemeMode) ? 255 : 0,
                        255,
                        0,
                        0),
                  ),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  final provider =
                      Provider.of<ThemeProvider>(context, listen: false);
                  provider.setThemeColor(pickerColor, pickThemeMode);
                  Navigator.of(context).pop();
                },
                child: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 24),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
