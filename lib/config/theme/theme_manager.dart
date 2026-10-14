import 'package:flutter/material.dart';
import 'package:news/core/colors_manager.dart';

class ThemeManager {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: ColorsManager.white,
  );
  static final ThemeData dark = ThemeData(
    scaffoldBackgroundColor: ColorsManager.black,
  );
}