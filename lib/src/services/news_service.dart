import 'package:app_news/src/models/news_models.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewsServices with ChangeNotifier {
  List<Article> headLines = [];
  final _URL_NEWS = "https://newsapi.org/v2";
  final _API_KEY = "647fc56764a3442d9f88439594a55ff3";

  NewsServices() {
    this.getTopHeadlines();
  }

  getTopHeadlines() async {
    //Obtener los datos por medio del servicio
    final url =
        Uri.parse('$_URL_NEWS/top-headlines?country=co&apiKey=$_API_KEY');
    final response = await http.get(url);

    /** Serializar los datos obtenidos en el response */
    final newsResponse = newsResponseFromJson(response.body);

    //Agregar las news a la lista headlines
    this.headLines.addAll(newsResponse.articles);
    notifyListeners();
  }
}
