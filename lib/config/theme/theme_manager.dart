import 'package:flutter/material.dart';
import 'package:news/core/colors_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStateProperty.all(ColorsManager.white),
      hintStyle: WidgetStateProperty.all(const TextStyle(color: Colors.grey, fontSize: 16)),
      textStyle: WidgetStateProperty.all(const TextStyle(color: ColorsManager.black, fontSize: 16)),
    ),
    searchViewTheme: const SearchViewThemeData(
      backgroundColor: ColorsManager.white,
      headerTextStyle: TextStyle(color: ColorsManager.black, fontSize: 16),
      headerHintStyle: TextStyle(color: Colors.grey, fontSize: 16),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: ColorsManager.white,
      centerTitle: true,
      titleTextStyle: TextStyle(
        color: ColorsManager.black,
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
      foregroundColor: ColorsManager.black,
    ),
    drawerTheme: DrawerThemeData(backgroundColor: ColorsManager.black),
    tabBarTheme: TabBarThemeData(
      indicatorColor: ColorsManager.black,
      labelColor: ColorsManager.black,
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.start,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: ColorsManager.white,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: ColorsManager.black,
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
        color: ColorsManager.black,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
      ),
    ),
  );

  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
    searchBarTheme: SearchBarThemeData(
      backgroundColor: WidgetStateProperty.all(ColorsManager.black),
      hintStyle: WidgetStateProperty.all(const TextStyle(color: Colors.white70, fontSize: 16)),
      textStyle: WidgetStateProperty.all(const TextStyle(color: ColorsManager.white, fontSize: 16)),
    ),
    searchViewTheme: const SearchViewThemeData(
      backgroundColor: ColorsManager.black,
      headerTextStyle: TextStyle(color: ColorsManager.white, fontSize: 16),
      headerHintStyle: TextStyle(color: Colors.white70, fontSize: 16),
    ),
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
    tabBarTheme: TabBarThemeData(
      indicatorColor: ColorsManager.white,
      labelColor: ColorsManager.white,
      unselectedLabelColor: Colors.grey,
      indicatorSize: TabBarIndicatorSize.tab,
      dividerColor: Colors.transparent,
      tabAlignment: TabAlignment.start,
    ),
    textTheme: TextTheme(
      displayLarge: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.w500,
        color: ColorsManager.black,
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
