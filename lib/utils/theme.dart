import 'package:flutter/material.dart';
import 'package:remora/utils/constant.dart';
import 'package:remora/utils/global.dart';
import 'package:shared_preferences/shared_preferences.dart';

class APPTheme {
  APPTheme() {
    // loadModeState();
  }
  static loadModeState() async {
    final pref = await SharedPreferences.getInstance();
    bool? resp = pref.getBool(darkMode);
    // if (resp == null) {
    //   themeMode.value = ThemeMode.system;
    // } else if (resp) {
    //   themeMode.value = ThemeMode.dark;
    // } else {
    //   themeMode.value = ThemeMode.light;
    // }
    themeMode.value = ThemeMode.dark;
  }

  static dartTheme() {
    return ThemeData.dark().copyWith(
      // f
      // fontFamily: "AppFont",
      primaryColorLight: const Color.fromARGB(255, 21, 20, 20),
      // secondaryHeaderColor: Colors.black,
      primaryColorDark: const Color.fromRGBO(241, 245, 252, 1),
      primaryColor: Colors.white,
      appBarTheme: const AppBarTheme(
          centerTitle: true,
          elevation: 1.0,
          titleTextStyle: TextStyle(
            color: Colors.white,
            fontSize: 23,
          ),
          backgroundColor: Colors.black,
          actionsIconTheme: IconThemeData(color: Colors.white),
          iconTheme: IconThemeData(color: Colors.white)),
      colorScheme: const ColorScheme(
          background: Color.fromARGB(255, 13, 56, 132),
          brightness: Brightness.dark,
          primary: Colors.deepOrangeAccent,
          onPrimary: Colors.deepOrangeAccent,
          secondary: Colors.black,
          onSecondary: Colors.black,
          error: Colors.red,
          onError: Colors.red,
          onBackground: Color.fromARGB(255, 0, 94, 255),
          surface: Color.fromARGB(255, 0, 94, 255),
          onSurface: Color.fromARGB(255, 0, 94, 255)),

      //colorScheme: ColorScheme(background: Colors.blue[800]!),
    );
  }

  static lightTheme() {
    return ThemeData.light().copyWith(
      //  fontFamily: "AppFont",
      primaryColorLight: Colors.white,
      secondaryHeaderColor: Colors.grey[100],
      primaryColorDark: const Color.fromRGBO(241, 245, 252, 1),
      primaryColor: Colors.white,

      appBarTheme: AppBarTheme(
          centerTitle: true,
          elevation: 1.0,
          titleTextStyle: const TextStyle(color: Colors.black, fontSize: 23),
          backgroundColor: Colors.grey[100],
          iconTheme: const IconThemeData(
              color: Colors
                  .black)), // colorScheme: ColorScheme(background: Colors.blue[800]),
      colorScheme: ColorScheme(
          background: const Color.fromARGB(255, 0, 94, 255),
          brightness: Brightness.light,
          primary: Colors.white,
          onPrimary: Colors.white,
          secondary: Colors.grey[100]!,
          onSecondary: Colors.grey[100]!,
          error: Colors.red,
          onError: Colors.red,
          onBackground: const Color.fromARGB(255, 0, 94, 255),
          surface: const Color.fromARGB(255, 0, 94, 255),
          onSurface: const Color.fromARGB(255, 0, 94, 255)),
    );
  }
}
