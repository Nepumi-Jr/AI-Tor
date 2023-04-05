import 'package:ai_tor_tell_you_an_appointment/backend/LangManager.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:ai_tor_tell_you_an_appointment/theme_style_provider.dart';

class ColorTheme extends StatelessWidget {
  const ColorTheme({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LangMan.get().setting.colorTitle,
            style: TextStyle(color: Theme.of(context).brightness != Brightness.dark ? Colors.black : Colors.white)),
              backgroundColor: Theme.of(context).brightness == Brightness.dark ? const Color.fromRGBO(66, 66, 66, 1) : Colors.white,
              foregroundColor: Theme.of(context).colorScheme.primary,
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
            margin: const EdgeInsets.only(bottom: 40),
            child: Column(
              children: [
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        LangMan.get().setting.colorToneTitle,
                        style: const TextStyle(fontSize: 24),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20),
                RadioListTile<ThemeMode>(
                  title: Row(
                    children: <Widget>[
                      const Icon(Icons.wb_sunny),
                      const SizedBox(width: 8),
                      Text(LangMan.get().setting.colorLightTheme),
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
                    children: <Widget>[
                      const Icon(Icons.nightlight_round),
                      const SizedBox(width: 8),
                      Text(LangMan.get().setting.colorDarkTheme),
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
                  LangMan.get().setting.colorWarning,
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
                  provider.saveThemeColor();
                  Navigator.of(context).pop();
                },
                child: Text(
                  LangMan.get().setting.colorConfirm,
                  style: const TextStyle(fontSize: 24),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
