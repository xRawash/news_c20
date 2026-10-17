import 'package:flutter/material.dart';
import 'package:news/l10n/app_localizations.dart';
import 'package:news/main_layout/home_screen/category_item.dart';
import 'package:news/models/category_model.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key, required this.onCategoryClicked});
  void Function(CategoryModel category) onCategoryClicked;

  @override
  Widget build(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(localizations.goodMorning, style: Theme.of(context).textTheme.headlineMedium,),
          SizedBox(height: 16,),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) => CategoryItem(
                title: CategoryModel.categories[index].getName(context),
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
