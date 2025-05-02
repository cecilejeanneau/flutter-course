import 'package:demo/mod8/page1.dart';
import 'package:demo/mod8/page2.dart';
import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

void main() {
  setPathUrlStrategy();
  runApp(App());
}

class Routes {
  // static Map<String, WidgetBuilder> get routes => {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) => {
    "/page-1": (context) => const PageOne(),
    "/page-2": (context) => const PageTwo(),
  };
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: "/page-1",
      routes:
        Routes.getRoutes(context),
    );
  }
}