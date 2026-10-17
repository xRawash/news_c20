import 'package:flutter/material.dart';
import 'package:news/core/colors_manager.dart';
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
  String appBarTitle = "Home";

  @override
  void initState() {
    super.initState();
    selectedScreen = HomeScreen(onCategoryClicked: onCategoryClicked);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
        centerTitle: true,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
      ),
      drawer: CustomDrawer(onGoToHomeClicked: onGoToHomeClicked,),
      body: selectedScreen,
    );
  }

  void onGoToHomeClicked() {
    Navigator.pop(context);
    setState(() {
      selectedScreen = HomeScreen(onCategoryClicked: onCategoryClicked,);
      appBarTitle = "Home";
    });
  }

  void onCategoryClicked(CategoryModel category) {
    setState(() {
      selectedScreen = NewsScreen();
      appBarTitle = category.name;
    });
  }
}
