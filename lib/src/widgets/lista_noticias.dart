import 'package:app_news/src/models/news_models.dart';
import 'package:app_news/src/theme/myTheme.dart';
import 'package:flutter/material.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article>? noticias;
  const ListaNoticias({Key? key, required this.noticias}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: (noticias != null) ? noticias!.length : 0, 
        itemBuilder: (BuildContext context, int index) {
          return _Noticia(noticia: noticias![index], index: index);
        });
  }
}

class _Noticia extends StatelessWidget {
  final Article noticia;
  final int index;

  const _Noticia({Key? key, required this.noticia, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              _TarjetaTopBar(
                noticia: noticia,
                index: index,
              ),
              _TarjetaTitulo(noticia: noticia),
              _TarjetaImagen(noticia: noticia),
              _TarjetaBody(noticia: noticia),
              _TarjetaBotones(),
              SizedBox(
                height: 10,
              ),
              Divider(
                thickness: 2,
                color: Colors.grey[800],
              )
            ],
          ),
        )
      ],
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar({
    Key? key,
    required this.noticia,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(children: [
        Text(
          '${index + 1}',
          style: TextStyle(color: myTheme.colorScheme.secondary),
        ),
        Text(
          '${noticia.source.name}',
          style: TextStyle(color: myTheme.colorScheme.secondary),
        ),
      ]),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  final Article noticia;
  const _TarjetaTitulo({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Text(
        '${noticia.title}',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
      ),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article noticia;
  const _TarjetaImagen({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
      child: Container(
          child: noticia.urlToImage != null
              ? FadeInImage(
                  placeholder: const AssetImage('assets/img/giphy.gif'),
                  image: NetworkImage('${noticia.urlToImage}'),
                )
              : const Image(
                  image: AssetImage('assets/img/no-image.png'),
                )),
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article noticia;
  const _TarjetaBody({Key? key, required this.noticia}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        child: Text(
            (noticia.description != null) ? '${noticia.description}' : ''));
  }
}

class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        RawMaterialButton(
          onPressed: () {},
          fillColor: myTheme.colorScheme.secondary,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Icon(Icons.star_border),
        ),
        SizedBox(
          width: 10,
        ),
        RawMaterialButton(
          onPressed: () {},
          fillColor: Colors.amber[700],
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Icon(Icons.add_reaction),
        )
      ]),
    );
  }
}
