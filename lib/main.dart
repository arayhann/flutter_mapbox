import 'package:flutter/material.dart';
import 'package:flutter_mapbox/pages/basic_map.dart';
import 'package:flutter_mapbox/pages/symbol_map.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static String accessToken =
      'pk.eyJ1IjoiYXJheWhhbiIsImEiOiJjazdoMmNpYmkwNXlwM25xa3ZzN3Rhc2p5In0.KsW5-BlR0oim5P5D0IB9sw';
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Mapbox Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            ListTile(
              title: const Text('Basic Map'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).push(_createRoute(const BasicMap()));
              },
            ),
            ListTile(
              title: const Text('Add Symbol Map'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.of(context).push(_createRoute(const SymbolMap()));
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Menu {
  final String title;
  final Widget page;

  Menu(this.title, this.page);
}

Route _createRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return child;
    },
  );
}
