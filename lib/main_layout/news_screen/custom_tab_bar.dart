import 'package:flutter/material.dart';
import 'package:news/core/colors_manager.dart';
import 'package:news/models/sources_model.dart';

class CustomTabBar extends StatefulWidget {
  const CustomTabBar({super.key});

  @override
  State<CustomTabBar> createState() => _CustomTabBarState();
}

class _CustomTabBarState extends State<CustomTabBar> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: SourcesModel.sources.length,
      child: TabBar(
        tabs: SourcesModel.sources.map((e) => Tab(text: e.name)).toList(),
        indicatorColor: ColorsManager.white,
        labelColor: ColorsManager.white,
        unselectedLabelColor: Colors.grey,
        indicatorSize: TabBarIndicatorSize.tab,
        isScrollable: true,
        tabAlignment: TabAlignment.start,
      ),
    );
  }
}
