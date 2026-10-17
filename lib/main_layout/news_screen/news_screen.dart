import 'package:flutter/material.dart';
import 'package:news/main_layout/news_screen/article_item/article_item.dart';
import 'package:news/models/article_model.dart';

import 'custom_tab_bar.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          CustomTabBar(),
          SizedBox(height: 16,),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context,index)=> SizedBox(height: 16,),
            itemCount: ArticleModel.articles.length
            ,itemBuilder: (context,index)=> ArticleItem(article: ArticleModel.articles[index],)),
          )
        ],
      ),
    );
  }
}
