import 'package:demo/tp/pages/login_page.dart';
import 'package:flutter/material.dart';

import '../pages/post_page.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) => {
    "/tweet-list-page": (context) => const PostPage(),
    "/login": (context) => const LoginPage(),
  };
}