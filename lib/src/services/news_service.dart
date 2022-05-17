import 'package:app_news/src/models/news_models.dart';
import 'package:flutter/material.dart';

class NewsServices with ChangeNotifier {
  List<Article> headLines = [];

  NewsServices() {
    this.getTopHeadlines();
  }

  getTopHeadlines() {
    print("Cargando Headlines");
  }
}
