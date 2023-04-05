import 'package:ai_tor_tell_you_an_appointment/theme_style_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'backend/faceImage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:ai_tor_tell_you_an_appointment/firebase_options.dart';
import 'package:ai_tor_tell_you_an_appointment/data/data.dart';
import 'screens/all_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

//void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<ThemeProvider>(
        create: (context) => ThemeProvider(),
        builder: (context, _) {
          final themeProvider = Provider.of<ThemeProvider>(context);
          FaceImage.loadSetImage();
          return ChangeNotifierProvider<User>(
            create: (context) => User(),
            child: MaterialApp(
              title: 'Flutter Demo',
              themeMode: themeProvider.themeMode,
              theme: themeProvider.lightTheme,
              darkTheme: themeProvider.darkTheme,
              debugShowCheckedModeBanner: false,
              routes: {
                '/': (context) => SafeArea(child: LogInPage()),
                '/home': (context) => SafeArea(child: HomePage()),
                '/calendar': (context) => SafeArea(child: CalendarPage()),
                '/graph': (context) => SafeArea(child: GraphPage()),
                '/settings': (context) => SafeArea(child: SettingsPage()),
              },
            ),
          );
        },
      );
}
