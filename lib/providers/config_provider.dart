import 'package:flutter/material.dart';
import 'package:news/prefs_manager/prefs_manager.dart';

class ConfigProvider extends ChangeNotifier {
  ThemeMode currentTheme = PrefsManager.getSavedTheme() ?? ThemeMode.light;
  String currentLang = PrefsManager.getSavedLanguage() ?? 'English';
  bool get isDark => currentTheme == ThemeMode.dark;
  bool get isEnglish => currentLang == 'English';
  void changeTheme(ThemeMode newTheme){
    currentTheme = newTheme;
    PrefsManager.saveCurrentTheme(currentTheme);
    notifyListeners();
  }
  void changeAppLanguage (String newLang) {
    if(currentLang == newLang) return;
    currentLang = newLang;
    PrefsManager.saveCurrentLanguage(currentLang);
    notifyListeners();
  }
}
