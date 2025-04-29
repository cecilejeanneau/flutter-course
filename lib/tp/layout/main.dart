import 'package:flutter/material.dart';

import '../content-body.dart';
import 'footer.dart';
import 'header.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo layout",
      home: AppHomePage(title: "Y"),
    );
  }
}

class AppHomePage extends StatelessWidget {
  final String title;

  const AppHomePage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Column(
          children: [
            Header(),
            Expanded(child: ContentBody()),
            Footer(),
          ],
        ));
  }
}
