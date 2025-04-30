import 'package:demo/tp/form/login_form.dart';
import 'package:flutter/material.dart';

import '../content_body.dart';
import 'footer.dart';
import 'header.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo layout",
      home: AppHomePage(
          title: "TwitterLike",
      ),
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
          centerTitle: true,
          title: Text(
            title,
            style: GoogleFonts.yatraOne(
              fontSize: 50,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        body: Column(
          children: [
            Header(),
            LoginForm(),
            Expanded(child: ContentBody()),
            Footer(),
          ],
        ));
  }
}
