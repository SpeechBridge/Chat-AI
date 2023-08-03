import 'package:ai_chat_flutter/presentation/theme/theme_colors.dart';
import 'package:flutter/material.dart';

final ThemeData lightThemeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.light,
  colorScheme: const ColorScheme.light(
    primary: LightThemeColors.primaryColor,
    onPrimary: LightThemeColors.white,
    secondary: LightThemeColors.accentColor,
    onSecondary: LightThemeColors.white,
    surface: LightThemeColors.white,
    onSurface: LightThemeColors.black,
    background: LightThemeColors.gradientBottom,
    onBackground: LightThemeColors.black,
    error: Colors.red,
    onError: LightThemeColors.white,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: LightThemeColors.black),
    bodyMedium:
        TextStyle(fontSize: 18, color: LightThemeColors.buttonTextColor),
  ),
  appBarTheme: const AppBarTheme(
    color: LightThemeColors.primaryColor,
    iconTheme: IconThemeData(color: LightThemeColors.white),
  ),
);

final ThemeData darkThemeData = ThemeData(
  useMaterial3: true,
  brightness: Brightness.dark,
  colorScheme: const ColorScheme.dark(
    primary: DarkThemeColors.primaryColor,
    onPrimary: DarkThemeColors.white,
    secondary: DarkThemeColors.accentColor,
    onSecondary: DarkThemeColors.white,
    surface: DarkThemeColors.black,
    onSurface: DarkThemeColors.white,
    background: DarkThemeColors.gradientBottom,
    onBackground: DarkThemeColors.white,
    error: Colors.red,
    onError: DarkThemeColors.white,
  ),
  textTheme: const TextTheme(
    displayLarge: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
        color: DarkThemeColors.white),
    bodyMedium: TextStyle(fontSize: 18, color: Colors.white),
  ),
  appBarTheme: const AppBarTheme(
    color: DarkThemeColors.primaryColor,
    iconTheme: IconThemeData(color: DarkThemeColors.white),
  ),
);
