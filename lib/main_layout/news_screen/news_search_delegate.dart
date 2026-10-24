import 'package:flutter/material.dart';
import 'package:news/API_services/api_services.dart';
import 'package:news/API_services/articles_response/Articles.dart';
import 'package:news/main_layout/news_screen/article_item/article_item.dart';

class NewsSearchDelegate extends SearchDelegate {
  @override
  TextStyle? get searchFieldStyle => const TextStyle(
        color: Colors.white,
        fontSize: 18,
      );

  @override
  ThemeData appBarTheme(BuildContext context) {
    return Theme.of(context);
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon:  Icon(Icons.clear, color: Colors.white),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, '');
      },
      icon:  Icon(Icons.arrow_back, color: Colors.white),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      return  Center(child: Text('Enter what you want to search about'));
    }
    return FutureBuilder(
      future: APIServices.searchArticles(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  Center(child: CircularProgressIndicator());
        }
        if (snapshot.hasError || snapshot.data?.articles == null) {
          return  Center(child: Text('Failed to load articles'));
        }
        List<Articles> articles = snapshot.data!.articles!;
        if (articles.isEmpty) {
          return  Center(child: Text('No articles found'));
        }
        return ListView.separated(
          padding:  EdgeInsets.all(8),
          itemBuilder: (context, index) => ArticleItem(article: articles[index]),
          separatorBuilder: (context, index) =>  SizedBox(height: 16),
          itemCount: articles.length,
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    if (query.trim().isEmpty) {
      return  Center(child: Text('Type keywords to search news...'));
    }
    return buildResults(context);
  }
}
