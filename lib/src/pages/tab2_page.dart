import 'package:app_news/src/models/category.dart';
import 'package:app_news/src/services/news_service.dart';
import 'package:app_news/src/theme/myTheme.dart';
import 'package:app_news/src/widgets/lista_noticias.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Tab2Page extends StatelessWidget {
  const Tab2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewsServices>(context);
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          _ListCategories(),
          Expanded(
              child: ListaNoticias(
                  noticias: newService.getArticulosCategoriaSeleccionada))
        ],
      )),
    );
  }
}

class _ListCategories extends StatelessWidget {
  _ListCategories({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsServices>(context).categories;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          physics: const BouncingScrollPhysics(),
          itemCount: categories.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: Column(children: [
                _CategoryButton(
                  category: categories[index],
                ),
                const SizedBox(height: 5),
                Text(categories[index].name)
              ]),
            );
          }),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  final Category category;

  const _CategoryButton({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<NewsServices>(context);
    return GestureDetector(
        //El provider en los eventos onTap no es necesario tener el liste en true
        onTap: () {
          final newService = Provider.of<NewsServices>(context, listen: false);
          newService.selectedCategory = category.name;
        },
        child: Container(
          width: 40,
          height: 40,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration:
              BoxDecoration(shape: BoxShape.circle, color: Colors.white),
          child: Icon(
            category.icon,
            color: (service.selectedCategory == category.name)
                ? myTheme.colorScheme.secondary
                : Colors.black54,
          ),
        ));
  }
}
