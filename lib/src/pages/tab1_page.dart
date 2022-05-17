import 'package:app_news/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_news/src/services/news_service.dart';

class Tab1Screen extends StatelessWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Se puede hacer de esta manera o extraer los headlines de los datos
    //final newService = Provider.of<NewsServices>(context);
    final headlines = Provider.of<NewsServices>(context).headLines;

    return ListaNoticias(noticias: headlines);
  }
}
