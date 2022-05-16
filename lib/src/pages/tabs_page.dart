import 'package:flutter/material.dart';

class TabsPage extends StatelessWidget {
   
  const TabsPage({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _paginas(),
      bottomNavigationBar: _navegacion(),
    );
  }
}

class _navegacion extends StatelessWidget {
  const _navegacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1,
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Para ti"),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: "Encabezados"),
      ]
    );
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