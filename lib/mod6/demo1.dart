import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo layout",
      home: AppHomePage(title: "State demo",),
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
        body: PasswordWidget(label: "Password3"));
  }
}


class PasswordWidget extends StatefulWidget {

  final String label;

  const PasswordWidget({super.key, required this.label});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
  bool isVisible = false;

  void toggleVisibility(bool value) {
    setState(() {
      isVisible = !isVisible;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          TextField(
            obscureText: isVisible,
            decoration: InputDecoration(labelText: "Password"),
          ),
          TextField(
            obscureText: isVisible,
            decoration: InputDecoration(label: Text("Password2")),
          ),
          TextField(
            obscureText: isVisible,
            decoration: InputDecoration(label: Text(widget.label)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(isVisible ? Icons.visibility_off_outlined : Icons.remove_red_eye_outlined),
              Switch(value: isVisible, onChanged: toggleVisibility)
              // Switch(value: isVisible, onChanged: (value) {
              //   toggleVisibility(value);
              // })
            ]
          )
        ],
      ),
    );
  }
}