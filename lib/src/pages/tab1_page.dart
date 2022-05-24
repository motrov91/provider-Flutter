import 'package:app_news/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:app_news/src/services/news_service.dart';

class Tab1Screen extends StatefulWidget {
  const Tab1Screen({Key? key}) : super(key: key);

  @override
  State<Tab1Screen> createState() => _Tab1ScreenState();
}

class _Tab1ScreenState extends State<Tab1Screen>
    with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    //Se puede hacer de esta manera o extraer los headlines de los datos
    //final newService = Provider.of<NewsServices>(context);

    final headlines = Provider.of<NewsServices>(context).headLines;

    return Scaffold(
      body: (headlines.length == 0)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListaNoticias(noticias: headlines),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
