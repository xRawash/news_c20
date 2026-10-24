import 'dart:convert';

import 'package:news/API_services/articles_response/ArticlesResponse.dart';
import 'package:news/API_services/sources_response/Sources.dart';
import 'package:news/API_services/sources_response/SourcesResponse.dart';
import 'package:news/models/category_model.dart';
import 'package:http/http.dart' as http;

class APIServices {
  static final String _baseURL = 'newsapi.org';
  static final String _apiKey = '7312a0e4def844018909c8b3362cd697';
  static final String _sourcesEndpoint = '/v2/top-headlines/sources';
  static final String _articlesEndpoint = '/v2/everything';

  static Future<SourcesResponse> getSources(CategoryModel category) async {
    Uri url = Uri.https(_baseURL, _sourcesEndpoint, {
      'apiKey': _apiKey,
      'category': category.id,
    });
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    SourcesResponse sourcesResponse = SourcesResponse.fromJson(json);
    return sourcesResponse;
  }
  static Future<ArticlesResponse> getArticles(Sources source) async {
    Uri url = Uri.https(_baseURL,_articlesEndpoint,{
      'apiKey':_apiKey,
      'sources': source.id,
    });
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
  static Future<ArticlesResponse> searchArticles(String query) async {
    Uri url = Uri.https(_baseURL,_articlesEndpoint,{
      'apiKey':_apiKey,
      'q': query,
    });
    http.Response serverResponse = await http.get(url);
    Map<String, dynamic> json = jsonDecode(serverResponse.body);
    ArticlesResponse articlesResponse = ArticlesResponse.fromJson(json);
    return articlesResponse;
  }
}
