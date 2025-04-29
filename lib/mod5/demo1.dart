import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Demo layout',
      home: AppHomePage(),
    );
  }

}

class AppHomePage extends StatelessWidget {
  const AppHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Bienvenue sur cette application'),
      ),
      body: const SingleChildScrollView(
        child: Expanded(
          child: Column(
            // mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Alcool",
                style: TextStyle(
                    color: Colors.pinkAccent,
                    fontSize: 36
                ),
              ),
              SizedBox(height: 2500),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: Text("Cigarettes"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text("Poppers"),
                  Text("5€")
                ],
              ),
              FlexWidget()
            ],
          ),
        ),
      ),
    );
  }
}

class FlexWidget extends StatelessWidget {
  const FlexWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flex(
      direction: Axis.horizontal,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text('data'),
        Text('data'),
        Text('data'),
      ],
    );
  }
}