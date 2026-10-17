import 'package:flutter/material.dart';
import 'package:news/core/assets_manager.dart';
import 'package:news/core/colors_manager.dart';
import 'package:news/main_layout/home_screen/category_item.dart';
import 'package:news/main_layout/news_screen/news_screen.dart';
import 'package:news/models/category_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.onCategoryClicked});
  void Function(CategoryModel category) onCategoryClicked;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Good Morning\nHere is Some News For You", style: Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: 16,),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => CategoryItem(
                title: CategoryModel.categories[index].name,
                categoryImage: CategoryModel.categories[index].imagePath,
                index: index,
                onTap: () => onCategoryClicked(CategoryModel.categories[index]),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: CategoryModel.categories.length,
            ),
          ),
        ],
      ),
    );
  }
}
