import 'package:app_news/src/pages/tabs_page.dart';
import 'package:app_news/src/theme/myTheme.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      theme: myTheme,
      debugShowCheckedModeBanner: false,
      home: TabsPage()
    );
  }
}