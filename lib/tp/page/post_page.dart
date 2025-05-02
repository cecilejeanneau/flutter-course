import 'package:demo/tp/layout/footer.dart';
import 'package:demo/tp/layout/header.dart';
import 'package:demo/tp/layout/x_app_bar.dart';
import 'package:flutter/material.dart';
import '../content/content_body.dart';

class PostPage extends StatelessWidget {
  const PostPage({super.key});

  @override
  Widget build(BuildContext context) {
    String? login = ModalRoute.of(context)?.settings.arguments as String?;

    return Scaffold(
      appBar: XAppBar(title: "Bienvenue sur X, ${login ?? "anonyme"} !"),
      body: Column(
        children: [
          Header(),
          Expanded(child: ContentBody()),
          Footer(),
        ],
      ),
    );
  }
}