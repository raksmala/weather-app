import 'package:flutter/material.dart';

class WeatherColorScheme {
  static ColorScheme colorScheme = ColorScheme.fromSeed(
    seedColor: Colors.lightBlue,
    brightness: Brightness.light,
  );

  static Color appBarColor = colorScheme.primary;
  static Color appBarTextColor = colorScheme.onPrimary;
  static Color backgroundColor = colorScheme.surface;
  static Color textColor = colorScheme.onSurface;
}

final ThemeData appTheme = ThemeData(
  colorScheme: WeatherColorScheme.colorScheme,
  useMaterial3: true,
  appBarTheme: AppBarTheme(
    backgroundColor: WeatherColorScheme.appBarColor,
    titleTextStyle: TextStyle(
      color: WeatherColorScheme.appBarTextColor,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),
  scaffoldBackgroundColor: WeatherColorScheme.backgroundColor,
  textTheme: TextTheme(
    bodyLarge: TextStyle(color: WeatherColorScheme.textColor),
    bodyMedium: TextStyle(color: WeatherColorScheme.textColor),
    bodySmall: TextStyle(color: WeatherColorScheme.textColor),
  ),
);
