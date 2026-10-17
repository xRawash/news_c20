import 'package:flutter/material.dart';
import 'package:news/core/colors_manager.dart';
import 'package:news/models/article_model.dart';
import 'package:timeago/timeago.dart' as timeago;

class ArticleItem extends StatelessWidget {
  ArticleItem({super.key, required this.article});
  ArticleModel article;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: ColorsManager.white),
      ),
      child:Column(
        children: [
          ClipRRect(
          borderRadius: BorderRadius.circular(16)
          ,child: Image.network(article.urlToImage!,height: 200,width: double.infinity,fit: BoxFit.cover,)),
          SizedBox(height: 10,),
          Text(article.title!,style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold, color: ColorsManager.white),),
          SizedBox(height: 10,),
          Row(
            children: [
              Text("By: ${article.author!}",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500, color: Colors.grey),),
              Spacer(),
              Text(timeago.format(DateTime.parse(article.publishedAt!)),style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500, color: Colors.grey),),
            ],
          )
        ],
      ),
    );
  }
}
