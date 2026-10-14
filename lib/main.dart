import 'package:flutter/material.dart';
import 'package:news/config/theme/theme_manager.dart';
import 'package:news/core/routes_manager.dart';

void main() {
  runApp(const News());
}

class News extends StatelessWidget {
  const News({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.light,
      darkTheme: ThemeManager.dark,
      themeMode: ThemeMode.system,
      initialRoute: RoutesManager.mainLayout,
      onGenerateRoute: RoutesManager.getRoute,
      supportedLocales: [Locale('en'), Locale('ar')],
      locale: Locale('en'),
    );
  }
}

