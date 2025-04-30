import 'package:flutter/material.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo layout",
      home: AppHomePage(title: "Demo widget de contenu"),
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
            Text(
              "Hello Michel !",
              style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 36),
            ),
            ElevatedButton(
              onPressed: () {},
              style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(Colors.amber)),
              child: Text("CLICK HERE !"),
            ),
            OutlinedButton(onPressed: () {}, child: Text("CLICK NOT HERE !")),
            FilledButton(onPressed: () {}, child: Text("DON'T CLICK HERE !")),
            Image.network(
                "https://upload.wikimedia.org/wikipedia/commons/1/17/Google-flutter-logo.png"),
            Expanded(
                child: Image.asset("assets/images/yoda.jpg")
            )
          ],
        ));
  }
}