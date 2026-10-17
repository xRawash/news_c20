import 'package:flutter/material.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/main_layout/drawer/custom_drawer.dart';
import 'package:news/main_layout/home_screen/home_Screen.dart';
import 'package:news/main_layout/news_screen/news_screen.dart';
import 'package:news/models/category_model.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late Widget selectedScreen;
  CategoryModel? selectedCategory;

  @override
  void initState() {
    super.initState();
    selectedScreen = HomeScreen(onCategoryClicked: onCategoryClicked);
  }

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    String appBarTitle = selectedCategory == null
        ? localizations.home
        : selectedCategory!.getName(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: const Icon(Icons.search))],
      ),
      drawer: CustomDrawer(onGoToHomeClicked: onGoToHomeClicked),
      body: selectedScreen,
    );
  }

  void onGoToHomeClicked() {
    Navigator.pop(context);
    setState(() {
      selectedCategory = null;
      selectedScreen = HomeScreen(onCategoryClicked: onCategoryClicked);
    });
  }

  void onCategoryClicked(CategoryModel category) {
    setState(() {
      selectedCategory = category;
      selectedScreen = NewsScreen();
    });
  }
}
