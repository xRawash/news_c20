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
  );
}