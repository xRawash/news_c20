import 'package:flutter/material.dart';
import 'package:news/core/assets_manager.dart';
import 'package:news/l10n/app_localizations.dart';

class CategoryModel {
  String id;
  String imagePath;
  String nameKey;

  CategoryModel({
    required this.id,
    required this.imagePath,
    required this.nameKey,
  });

  String getName(BuildContext context) {
    AppLocalizations localizations = AppLocalizations.of(context)!;
    switch (id) {
      case 'general':
        return localizations.general;
      case 'business':
        return localizations.business;
      case 'sports':
        return localizations.sports;
      case 'technology':
        return localizations.technology;
      case 'entertainment':
        return localizations.entertainment;
      case 'health':
        return localizations.health;
      case 'science':
        return localizations.science;
      default:
        return '';
    }
  }

  static List<CategoryModel> categories = [
    CategoryModel(
      id: 'general',
      imagePath: ImageAssets.general,
      nameKey: 'general',
    ),
    CategoryModel(
      id: 'business',
      imagePath: ImageAssets.business,
      nameKey: 'business',
    ),
    CategoryModel(
      id: 'sports',
      imagePath: ImageAssets.sports,
      nameKey: 'sports',
    ),
    CategoryModel(
      id: 'technology',
      imagePath: ImageAssets.technology,
      nameKey: 'technology',
    ),
    CategoryModel(
      id: 'entertainment',
      imagePath: ImageAssets.entertainment,
      nameKey: 'entertainment',
    ),
    CategoryModel(
      id: 'health',
      imagePath: ImageAssets.health,
      nameKey: 'health',
    ),
    CategoryModel(
      id: 'science',
      imagePath: ImageAssets.science,
      nameKey: 'science',
    ),
  ];
}
