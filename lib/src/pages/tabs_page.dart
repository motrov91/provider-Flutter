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
    return PageView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.green,
        )
      ],
    );
  }
}

class _NavegacionModel with ChangeNotifier {
  int _paginaActual = 0;

  int get paginaActual => this._paginaActual;

  //ChangeNotifier es propio de flutter

  set paginaActual(int valor) {
    this._paginaActual = valor;
    notifyListeners();
  }
}
