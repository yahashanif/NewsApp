import 'dart:convert';

import 'package:news_app/app/url.dart';
import 'package:news_app/models/article.dart';
import 'package:http/http.dart' as http;

class NewsAPIService {
  Future<List<Article>> getArticles(
      {required String codeCountry, required String typeNews}) async {
    final param = {
      'country': codeCountry,
      'category': typeNews,
      'apiKey': APIKEY
    };
    Uri url = Uri.https(BASEURL, '$version/top-headlines', param);
    print(url);
    var response = await http.get(
      url,
    );
    print(response.body);

    if (response.statusCode == 200) {
      List data = jsonDecode(response.body)['articles'];
      List<Article> articles = [];
      for (var item in data) {
        articles.add(Article.fromJson(item));
      }
      return articles;
    } else {
      throw Exception('Gagal get News');
    }
  }
}

// top-headlines?country=us&category=business&apiKey=