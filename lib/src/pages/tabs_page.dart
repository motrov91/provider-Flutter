import 'package:app_news/src/pages/tab1_page.dart';
import 'package:app_news/src/pages/tab2_page.dart';
import 'package:app_news/src/services/news_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  const TabsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      //Creamos una instancia del NavegationModel
      create: (_) => new _NavegacionModel(),
      child: Scaffold(
        body: _paginas(),
        bottomNavigationBar: _navegacion(),
      ),
    );
  }
}

class _navegacion extends StatelessWidget {
  const _navegacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavegacionModel>(context);

    return BottomNavigationBar(
        //Dispara el indice actual
        currentIndex: navigationModel.paginaActual,
        onTap: (i) => navigationModel.paginaActual = i,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Para ti"),
          BottomNavigationBarItem(
              icon: Icon(Icons.public), label: "Encabezados"),
        ]);
  }
}

class _paginas extends StatelessWidget {
  const _paginas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final navModel = Provider.of<_NavegacionModel>(context);

    return PageView(
      controller: navModel.pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        
        Tab1Screen(),
        Tab2Page(),

        Container(
          color: Colors.green,
        ),
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;
  PageController _pageController = new PageController();

  int get paginaActual => this._paginaActual;

  //ChangeNotifier es propio de flutter

  set paginaActual(int valor) {
    this._paginaActual = valor;

    _pageController.animateToPage(valor,
        duration: Duration(milliseconds: 50), curve: Curves.easeOut);

    notifyListeners();
  }

  PageController get pageController => this._pageController;
}
