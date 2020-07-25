import 'package:flutter/material.dart';

class RoutGenerator {
  static Route<dynamic> generateRout(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      // case '/':
      //   return MaterialPageRoute(builder: (_) => Splashs());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('ErrorRoute'),
        ),
        body: Center(
          child: Text('ERROR'),
        ),
      );
    });
  }
}
