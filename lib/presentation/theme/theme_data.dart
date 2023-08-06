import 'package:ai_chat_flutter/presentation/theme/color_schemes.g.dart';
import 'package:flutter/material.dart';

final ThemeData lightThemeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: lightColorScheme,
  // textTheme: const TextTheme(
  //   displayLarge: TextStyle(
  //       fontSize: 32,
  //       fontWeight: FontWeight.bold,
  //       color: LightThemeColors.black),
  //   bodyMedium:
  //       TextStyle(fontSize: 18, color: LightThemeColors.buttonTextColor),
  // ),
);

final ThemeData darkThemeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: darkColorScheme,
  // textTheme: const TextTheme(
  //   displayLarge: TextStyle(
  //       fontSize: 32,
  //       fontWeight: FontWeight.bold,
  //       color: DarkThemeColors.white),
  //   bodyMedium: TextStyle(fontSize: 18, color: Colors.white),
  // ),
);
