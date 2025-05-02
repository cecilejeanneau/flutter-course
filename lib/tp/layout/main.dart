import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import '../routes/routes.dart';

void main() {
  setPathUrlStrategy();
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Twitter TP",
      initialRoute: "/login",
      routes:
        Routes.getRoutes(context),
    );
  }
}
