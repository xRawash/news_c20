import 'package:flutter/material.dart';
import 'package:news/core/colors_manager.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/providers/config_provider.dart';
import 'package:provider/provider.dart';

class CustomDrawer extends StatefulWidget {
  const CustomDrawer({super.key, required this.onGoToHomeClicked});
  final void Function() onGoToHomeClicked;

  @override
  State<CustomDrawer> createState() => _CustomDrawerState();
}

class _CustomDrawerState extends State<CustomDrawer> {
  @override
  Widget build(BuildContext context) {
    ConfigProvider configProvider = Provider.of<ConfigProvider>(context);
    AppLocalizations localizations = AppLocalizations.of(context)!;

    return Drawer(
      child: Column(
        children: [
          Container(
            height: 166,
            width: double.infinity,
            color: ColorsManager.white,
            child: Center(
              child: Text(
                localizations.newsApp,
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: ColorsManager.black),
              ),
            ),
          ),
          ListTile(
            onTap: () => widget.onGoToHomeClicked(),
            iconColor: ColorsManager.white,
            textColor: ColorsManager.white,
            leading: const Icon(Icons.home),
            title: Text(
              localizations.goToHome,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ),
          const Divider(thickness: 2, indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 16,
              children: [
                Row(
                  children: [
                    const Icon(Icons.format_paint_outlined, color: ColorsManager.white),
                    const SizedBox(width: 16),
                    Text(localizations.theme, style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                DropdownMenu<String>(
                  initialSelection: configProvider.isDark ? "Dark" : "Light",
                  width: double.infinity,
                  textStyle: const TextStyle(color: ColorsManager.white),
                  onSelected: (value) {
                    if (value != null) {
                      configProvider.changeTheme(value == "Dark" ? ThemeMode.dark : ThemeMode.light);
                      Navigator.pop(context);
                      setState(() {});
                    }
                  },
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "Dark", label: localizations.dark),
                    DropdownMenuEntry(value: "Light", label: localizations.light),
                  ],
                ),
              ],
            ),
          ),
          const Divider(thickness: 2, indent: 16, endIndent: 16),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: 16,
              children: [
                Row(
                  children: [
                    const Icon(Icons.language, color: ColorsManager.white),
                    const SizedBox(width: 16),
                    Text(localizations.language, style: Theme.of(context).textTheme.titleMedium),
                  ],
                ),
                DropdownMenu<String>(
                  width: double.infinity,
                  initialSelection: configProvider.currentLang,
                  textStyle: const TextStyle(color: ColorsManager.white),
                  onSelected: (value) {
                    if (value != null) {
                      configProvider.changeAppLanguage(value);
                      Navigator.pop(context);
                      setState(() {});
                    }
                  },
                  dropdownMenuEntries: [
                    DropdownMenuEntry(value: "English", label: localizations.english),
                    DropdownMenuEntry(value: "Arabic", label: localizations.arabic),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
