import 'package:flutter/material.dart';
import 'package:news/API_services/articles_response/Articles.dart';
import 'package:news/core/colors_manager.dart';
import 'package:news/providers/config_provider.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:url_launcher/url_launcher.dart';

class ArticleItem extends StatelessWidget {
  const ArticleItem({super.key, required this.article});
  final Articles article;

  @override
  Widget build(BuildContext context) {
    ConfigProvider configProvider = Provider.of<ConfigProvider>(context);
    
    String formattedTime = '';
    if (article.publishedAt != null && article.publishedAt!.isNotEmpty) {
      try {
        formattedTime = timeago.format(DateTime.parse(article.publishedAt!));
      } catch (e) {
        formattedTime = article.publishedAt!;
      }
    }

    return InkWell(
      onTap: () {
        _launchURL(article.url ?? '');
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: configProvider.isDark ? ColorsManager.white : ColorsManager.black),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: article.urlToImage != null && article.urlToImage!.isNotEmpty
                  ? Image.network(
                      article.urlToImage!,
                      height: 200,
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                        height: 200,
                        color: Colors.grey.withOpacity(0.3),
                        child: const Center(child: Icon(Icons.broken_image, size: 50, color: Colors.grey)),
                      ),
                    )
                  : Container(
                      height: 200,
                      color: Colors.grey.withOpacity(0.3),
                      child: const Center(child: Icon(Icons.image_not_supported, size: 50, color: Colors.grey)),
                    ),
            ),
            const SizedBox(height: 10),
            Text(
              article.title ?? '',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: Text(
                    "By: ${article.author ?? 'Unknown'}",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  formattedTime,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.grey),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  Future<void> _launchURL (String articleUrl) async {
    final Uri url = Uri.parse(articleUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)){
      throw Exception('Could not launch $url');
    }
  }
}
