import 'Articles.dart';

class ArticlesResponse {
  String? status;
  int? totalResults;
  List<Articles>? articles;

  ArticlesResponse({this.status, this.totalResults, this.articles});

  ArticlesResponse.fromJson(dynamic json) {
    status = json['status'];
    totalResults = json['totalResults'];
    if (json['articles'] != null) {
      articles = [];
      json['articles'].forEach((v) {
        articles?.add(Articles.fromJson(v));
      });
    }
  }
}
