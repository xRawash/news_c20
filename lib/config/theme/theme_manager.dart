import 'package:flutter/material.dart';
import 'package:news/core/colors_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
  );

  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.black,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: ColorsManager.white,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      foregroundColor: ColorsManager.white,
    ),
    drawerTheme: DrawerThemeData(backgroundColor: ColorsManager.black),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: ColorsManager.white,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
    ),
  );
}