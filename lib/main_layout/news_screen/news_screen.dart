import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:news/API_services/api_services.dart';
import 'package:news/API_services/articles_response/Articles.dart';
import 'package:news/API_services/articles_response/ArticlesResponse.dart';
import 'package:news/API_services/sources_response/Sources.dart';
import 'package:news/API_services/sources_response/SourcesResponse.dart';
import 'package:news/core/colors_manager.dart';
import 'package:news/main_layout/news_screen/article_item/article_item.dart';
import 'package:news/models/category_model.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../providers/config_provider.dart';
import 'custom_tab_bar.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key, required this.selectedCategory});

  final CategoryModel selectedCategory;

  @override
  State<NewsScreen> createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  late Future<SourcesResponse> sourcesFuture;
  Sources? selectedSource;

  @override
  void initState() {
    super.initState();
    sourcesFuture = APIServices.getSources(widget.selectedCategory);
  }

  @override
  Widget build(BuildContext context) {
    ConfigProvider configProvider = Provider.of<ConfigProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: FutureBuilder<SourcesResponse>(
        future: sourcesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError ||
              snapshot.data?.sources == null ||
              snapshot.data!.sources!.isEmpty) {
            return const Center(child: Text("No sources found"));
          }

          List<Sources> sources = snapshot.data!.sources!;
          selectedSource ??= sources[0];

          return Column(
            children: [
              CustomTabBar(
                sources: sources,
                onSourceSelected: (source) {
                  setState(() {
                    selectedSource = source;
                  });
                },
              ),
              const SizedBox(height: 16),
              Expanded(
                child: FutureBuilder<ArticlesResponse>(
                  future: APIServices.getArticles(selectedSource!),
                  builder: (context, articleSnapshot) {
                    if (articleSnapshot.connectionState ==
                        ConnectionState.waiting) {
                      return const Center(child: CircularProgressIndicator());
                    }
                    if (articleSnapshot.hasError ||
                        articleSnapshot.data?.articles == null) {
                      return const Center(
                        child: Text("Failed to load articles"),
                      );
                    }

                    List<Articles> articles = articleSnapshot.data!.articles!;
                    if (articles.isEmpty) {
                      return const Center(child: Text("No articles found"));
                    }

                    return ListView.separated(
                      itemCount: articles.length,
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 16),
                      itemBuilder: (context, index) => InkWell(
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: configProvider.isDark
                                    ? ColorsManager.white
                                    : ColorsManager.black,
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Image.network(
                                      articles[index].urlToImage!,
                                    ),
                                  ),
                                  SizedBox(height: 8,),
                                  Text(
                                    articles[index].content!,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall,
                                  ),
                                  SizedBox(height: 8,),
                                  ElevatedButton(
                                    onPressed: () {
                                      _launchURL(articles[index].url!);
                                    },
                                    child: Text(
                                      "View Full Article",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        child: ArticleItem(article: articles[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _launchURL(String articleUrl) async {
    final Uri url = Uri.parse(articleUrl);
    if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
      Fluttertoast.showToast(
        msg: "Failed to launch URL",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }
}
