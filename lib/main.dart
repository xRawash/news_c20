import 'package:flutter/material.dart';
import 'package:news/config/theme/theme_manager.dart';
import 'package:news/core/routes_manager.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'prefs_manager/prefs_manager.dart';
import 'providers/config_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PrefsManager.init();
  runApp(ChangeNotifierProvider(
      create: (context) => ConfigProvider(),
      child: const News()));
}

class News extends StatelessWidget {
  const News({super.key});
  @override
  Widget build(BuildContext context) {
    ConfigProvider configProvider = Provider.of<ConfigProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeManager.light,
      darkTheme: ThemeManager.dark,
      themeMode: configProvider.currentTheme,
      initialRoute: RoutesManager.mainLayout,
      onGenerateRoute: RoutesManager.getRoute,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      locale: Locale(configProvider.currentLang == 'English' ? 'en' : 'ar'),
    );
  }
}
