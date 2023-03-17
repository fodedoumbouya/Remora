import 'package:flutter/material.dart';
import 'package:remora/pages/mainPage.dart';
import 'package:remora/utils/global.dart';
import 'package:remora/utils/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    APPTheme.loadModeState();

    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeMode,
        builder: (_, mode, __) {
          return MaterialApp(
            title: 'Remora',
            theme: APPTheme.lightTheme(),
            themeMode: mode,
            darkTheme: APPTheme.dartTheme(),
            home: const MainRoutePages(),
            debugShowCheckedModeBanner: false,
          );
        });
  }
}
