import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final darkTheme = ThemeData(
    primarySwatch: Colors.blue,
    scaffoldBackgroundColor: const Color(0xFF191D21),
    primaryColor: const Color(0xFF191D21),
    brightness: Brightness.dark,
    accentColor: Colors.white,
    accentIconTheme: IconThemeData(color: const Color(0xFF191D21)),
    dividerColor: const Color(0xFF191D21),
    fontFamily: 'Poppins');

final lightTheme = ThemeData(
    primarySwatch: Colors.grey,
    primaryColor: Colors.white,
    scaffoldBackgroundColor: Colors.white,
    brightness: Brightness.light,
    accentColor: Colors.black,
    accentIconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white54,
    fontFamily: 'Poppins');

final themeProvider = StateNotifierProvider((ref) => ThemeState());

class ThemeState extends StateNotifier<ThemeData> {
  ThemeState() : super(lightTheme);

  void setDark() {
    state = darkTheme;
  }

  void setLight() {
    state = lightTheme;
  }
}
