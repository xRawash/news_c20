import 'package:news/core/assets_manager.dart';

class CategoryModel {
  String id;
  String imagePath;
  String name;

  CategoryModel({
    required this.id,
    required this.imagePath,
    required this.name,
  });

  static List<CategoryModel> categories = [
    CategoryModel(
      id: 'general',
      imagePath: ImageAssets.general,
      name: 'General',
    ),
    CategoryModel(
      id: 'business',
      imagePath: ImageAssets.business,
      name: 'Business',
    ),
    CategoryModel(id: 'sports', imagePath: ImageAssets.sports, name: 'Sports'),
    CategoryModel(
      id: 'technology',
      imagePath: ImageAssets.technology,
      name: 'Technology',
    ),
    CategoryModel(
      id: 'entertainment',
      imagePath: ImageAssets.entertainment,
      name: 'Entertainment',
    ),
    CategoryModel(id: 'health', imagePath: ImageAssets.health, name: 'Health'),

    CategoryModel(
      id: 'science',
      imagePath: ImageAssets.science,
      name: 'Science',
    ),
  ];
}
