import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:app_news/src/models/category.dart';
import 'package:app_news/src/models/news_models.dart';

class NewsServices with ChangeNotifier {
  List<Article> headLines = [];
  String _selectedCategory = 'business';
  bool _isLoading = true;

  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.volleyball, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
  ];

  Map<String, List<Article>> categoryArticles = {};

  final _URL_NEWS = "https://newsapi.org/v2";
  final _API_KEY = "647fc56764a3442d9f88439594a55ff3";

  //Constructor
  NewsServices() {
    getTopHeadlines();

    categories.forEach((item) {
      categoryArticles[item.name] = [];
    });

    getArticleCategory(selectedCategory);
  }

  //Obtenemos el valor del isLoading
  bool get isLoading => _isLoading;

  //Obtenemos la categoria seleccionada.
  String get selectedCategory => _selectedCategory;
  set selectedCategory(String valor) {
    _selectedCategory = valor;
    _isLoading = true;
    getArticleCategory(valor);

    notifyListeners();
  }

  //Obtener noticias de la categoria seleccionada
  List<Article>? get getArticulosCategoriaSeleccionada =>
      categoryArticles[selectedCategory];

  getTopHeadlines() async {
    //Obtener los datos por medio del servicio
    final url =
        Uri.parse('$_URL_NEWS/top-headlines?country=co&apiKey=$_API_KEY');
    final response = await http.get(url);

    /** Serializar los datos obtenidos en el response */
    final newsResponse = newsResponseFromJson(response.body);

    //Agregar las news a la lista headlines
    headLines.addAll(newsResponse.articles);
    notifyListeners();
  }

  getArticleCategory(String category) async {
    //Condicionamos para indicar si la lista ya tiene informacion, no la quiero duplicar
    if (categoryArticles[category]!.length > 0) {
      _isLoading = true;
      notifyListeners();
      return categoryArticles[category];
    }

    //Obtener los datos por medio del servicio
    final url = Uri.parse(
        '$_URL_NEWS/top-headlines?country=co&apiKey=$_API_KEY&category=${category}');
    final response = await http.get(url);

    /** Serializar los datos obtenidos en el response */
    final newsResponse = newsResponseFromJson(response.body);

    //LLenar el mapa con la categoria seleccionada
    categoryArticles[category]?.addAll(newsResponse.articles);

    _isLoading = false;
    notifyListeners();
  }
}
